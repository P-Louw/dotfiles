local g = vim.g

-- Set to nvim if you want to use neovim's built-in LSP client.
-- languageclient-neovim if you want to use autozimu/LanguageClient-neovim.
-- disable if you only want the syntax highlighting and the FSI integration.
-- Default: nvim if you are using Neovim 0.5+, languageclient-neovim otherwise.
-- let g:fsharp#backend = "languageclient-neovim"

-- This option overrides the path to the FSAC Ionide-vim uses.
-- By default, Ionide-vim uses the FSAC installed globally with dotnet tool install.
-- For example, if you want to use a project-local FSAC, set the following:
-- Default: ['fsautocomplete', '--background-service-enabled']
-- let g:fsharp#fsautocomplete_command =
--     \ [ 'dotnet',
--     \   'fsautocomplete',
--     \   '--background-service-enabled'
--     \ ]

-- Neovim's LSP client comes with no default colorscheme, so Ionide-vim sets 
-- a VSCode-like one for LSP diagnostics by default. You can disable this by the following:
-- Default: enabled
--g.fsharp let g:fsharp#lsp_recommended_colorscheme = 0
g["fsharp#lsp_recommended_colorscheme"] = 0

-- With nvim-lspconfig, you would manually call the setup function for each LSP servers.
-- Ionide-vim does this automatically by default, but you can disable it.
-- Default: enabled
-- let g:fsharp#lsp_auto_setup = 0
-- lua << EOF
-- require'ionide'.setup{}
-- EOF

--By default, Ionide-vim sets the following so that CodeLens gets refreshed automatically.
--Default: enabled
--augroup FSharp_AutoRefreshCodeLens
--    autocmd!
--    autocmd CursorHold,InsertLeave <buffer> lua vim.lsp.codelens.refresh()
--augroup END
--
--You can disable this by setting the below option:
--let g:fsharp#lsp_codelens = 0

-- Enable/disable automatic loading of the workspace on opening F# files
-- Default: enabled
-- let g:fsharp#automatic_workspace_init = 1 " 0 to disable.

-- Set the deep level of directory hierarchy when searching for sln/fsprojs
-- Default: 2
-- let g:fsharp#workspace_mode_peek_deep_level = 2

-- Ignore specific directories when loading a workspace
-- Default: empty
-- let g:fsharp#exclude_project_directories = ['paket-files']
-- Enable/disable linter and unused opens/declarations analyzer
-- Default: all enabled
-- 
-- You may want to bind LanguageClient#textDocument_codeAction() to some shortcut key. Refer to their docs.
-- 0 to disable.
-- let g:fsharp#linter = 1
-- let g:fsharp#unused_opens_analyzer = 1
-- let g:fsharp#unused_declarations_analyzer = 1

-- Enable/disable automatic calling of :FSharpReloadWorkspace on saving fsproj
-- Default: enabled
-- let g:fsharp#automatic_reload_workspace = 1 " 0 to disable.

-- Show type signature at cursor position
-- Default: disabled
-- let g:fsharp#show_signature_on_cursor_move = 0 " 1 to disable.
