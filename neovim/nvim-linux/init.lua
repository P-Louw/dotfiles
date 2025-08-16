--[[
require("options")
require("vars")
require("plugins")
require("mappings")

require("statusline")
require("cmp_conf")
-- After cmp to set auto pair behaviour:
require("autopair_conf")
require("lsp_conf")
require("telescope_conf")
require("themes_conf")
--]]
--vim.lsp.set_log_level('debug')
require('config.lazy')
require('config.options')
