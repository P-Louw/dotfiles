return {
  { "williamboman/mason.nvim" },
    {
      "williamboman/mason-lspconfig.nvim",
      dependencies = {
        "williamboman/mason.nvim",
      },
      config = function ()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        mason.setup()
        mason_lspconfig.setup({
          ensure_installed = {
            "ts_ls",
            "html",
            "cssls",
            "tailwindcss",
            "lua_ls",
            "emmet_ls",
            "pyright",
            "ansiblels",
            "nil_ls",
            "yamlls",
          },
          automatic_installation = true,
        })
      end,
  }
}
