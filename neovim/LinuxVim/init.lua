
require("options")
require("vars")
require("plugins")
require("mappings")
require("mappings").global_mapping()
require("statusline")
require("cmp_conf")
-- After cmp to set auto pair behaviour:
require("autopair_conf")
require("indent_conf")
require("lsp_conf")
require("telescope_conf")
require("themes_conf")

--[[
-- F# treesitter parser:
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.fsharp = {
  install_info = {
    url = "https://github.com/Nsidorenco/tree-sitter-fsharp",
    branch = "main",
    files = {"src/scanner.c", "src/parser.c" },
  },
  filetype = "fsharp",
}
]]--

--[[
function Read_range(start, end, path)
    local cmd = string.format('r! sed -n %s,%sp %s', start, end, path)
    return cmd
end
]]--
--vim.lsp.set_log_level('debug')
