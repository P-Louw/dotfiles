#!/usr/bin/env luajit
-- Soundcraft Notepad-12FX control for waybar (via scnp-cli).
-- scnp-cli has no "read state" command, so selections are tracked in cache
-- files here (they reflect what you set through the tile).

local cache = os.getenv("XDG_CACHE_HOME") or (os.getenv("HOME") .. "/.cache")
local SRC_FILE   = cache .. "/scnp-source"    -- last audio-routing index (0..3)
local DUCK_FILE  = cache .. "/scnp-ducker"     -- "on" | "off"
local RANGE_FILE = cache .. "/scnp-range"      -- current duck range, dB

-- ducker defaults (edit to taste) -------------------------------------------
local DUCK_INPUTS    = 3    -- bitmask bit0=ch1..bit3=ch4; 3 = ch1+2 (mics)
local DUCK_RELEASE   = 500  -- release, ms (0..5000)
local DUCK_RANGE_DEF = 20   -- duck amount, dB (0..90)
local DUCK_THRESHOLD = -20  -- trigger level, dB (-60..0)

local SRC_SIGNAL, DUCK_SIGNAL = 8, 9
local SRC_NAME = { [0]="MIC 3+4", [1]="LINE 5+6", [2]="LINE 7+8", [3]="MASTER L+R" }

local function read_file(path, default)
  local f = io.open(path, "r"); if not f then return default end
  local v = f:read("*l"); f:close(); return v or default
end
local function write_file(path, v)
  local f = io.open(path, "w"); if f then f:write(v); f:close() end
end
local function sh(cmd) local ok = os.execute(cmd); return ok == 0 or ok == true end
local function refresh(sig) os.execute("pkill -RTMIN+" .. sig .. " waybar 2>/dev/null") end
local function read_range() return tonumber(read_file(RANGE_FILE, tostring(DUCK_RANGE_DEF))) end

local function bits4(n)  -- 4-bit binary string, e.g. 3 -> "0011"
  local s = ""
  for i = 3, 0, -1 do s = s .. math.floor(n / (2 ^ i)) % 2 end
  return s
end

local function emit(text, class, tooltip)
  tooltip = tooltip:gsub('"', '\\"')
  io.write(string.format('{"text":"%s","class":"%s","tooltip":"%s"}\n', text, class, tooltip))
end

local function apply_ducker()
  sh("scnp-cli ducker-on " .. DUCK_INPUTS .. " " .. DUCK_RELEASE .. "ms")
  sh("scnp-cli ducker-range " .. read_range() .. "dB")
  sh("scnp-cli ducker-threshold " .. DUCK_THRESHOLD .. "dB")
end

local action, param = arg[1], arg[2]

if action == "set" then
  if sh("scnp-cli audio-routing " .. param) then write_file(SRC_FILE, param) end
  refresh(SRC_SIGNAL)

elseif action == "status" then
  local n = tonumber(param)
  local active = read_file(SRC_FILE, "-1") == tostring(n)
  local name = SRC_NAME[n]
  if active then emit(name, "active", name .. " \226\128\148 active")
  else           emit(name, "",       "Route capture 3+4 from " .. name) end

elseif action == "ducker-toggle" then
  if read_file(DUCK_FILE, "off") == "on" then
    if sh("scnp-cli ducker-off") then write_file(DUCK_FILE, "off") end
  else
    apply_ducker(); write_file(DUCK_FILE, "on")
  end
  refresh(DUCK_SIGNAL)

elseif action == "ducker-status" then
  local rng = read_range()
  if read_file(DUCK_FILE, "off") == "on" then
    emit("DUCK", "active", string.format(
      "Ducker ON \226\128\148 watch 0b%s, release %dms, range %ddB, threshold %ddB\\nscroll to change range",
      bits4(DUCK_INPUTS), DUCK_RELEASE, rng, DUCK_THRESHOLD))
  else
    emit("DUCK", "", "Ducker off \226\128\148 click to enable (range " .. rng .. "dB, scroll to change)")
  end

elseif action == "duck-range" then
  local new = read_range() + (tonumber(param) or 0)
  if new < 0 then new = 0 elseif new > 90 then new = 90 end
  write_file(RANGE_FILE, tostring(new))
  if read_file(DUCK_FILE, "off") == "on" then sh("scnp-cli ducker-range " .. new .. "dB") end
  refresh(DUCK_SIGNAL)

elseif action == "duck-set" then   -- absolute range (for the eww slider)
  local new = math.floor(tonumber(param) or 20)
  if new < 0 then new = 0 elseif new > 90 then new = 90 end
  write_file(RANGE_FILE, tostring(new))
  if read_file(DUCK_FILE, "off") == "on" then sh("scnp-cli ducker-range " .. new .. "dB") end
  refresh(DUCK_SIGNAL)

elseif action == "popup" then   -- toggle the eww bubble on the monitor under the cursor
  local function run(c) local h = io.popen(c); if not h then return "" end
    local o = h:read("*a") or ""; h:close(); return o end
  if run("eww active-windows 2>/dev/null"):find("audio%-bubble") then
    os.execute("eww close audio-bubble")
  else
    local cx = tonumber((run("hyprctl cursorpos 2>/dev/null")):match("^(%-?%d+)")) or 0
    local mon = run(string.format(
      "hyprctl monitors -j | jq -r --argjson cx %d '.[]|select(.x<=$cx and $cx<(.x+.width))|.name' | head -1", cx))
      :gsub("%s+$", "")
    if mon ~= "" then os.execute("eww open audio-bubble --screen " .. mon)
    else os.execute("eww open audio-bubble") end
  end
end
