
-- Set bb for babashka scripts.
vim.filetype.add({
  extension = {
    bb = 'bb'
  }
})

require("options")
require("vars")
require("plugins")
require("mappings")

require("statusline")
require("tabline_conf")
require("blank-indent_conf")
require("cmp_conf")
-- After cmp to set auto pair behaviour:
require("autopair_conf")
require("lsp_conf")
require("ionide_conf")
require("telescope_conf")
require("themes_conf")

--vim.lsp.set_log_level('debug')
