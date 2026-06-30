return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		"williamboman/mason.nvim",
		{ "williamboman/mason-lspconfig.nvim", config = function() end },
		{ "b0o/schemastore.nvim", lazy = true },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = true }

				-- LSP navigation keybinds
				opts.desc = "Go to References"
				keymap.set("n", "gr", vim.lsp.buf.references, opts)

				opts.desc = "Go to Declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

				opts.desc = "Go to Definition"
				keymap.set("n", "gd", vim.lsp.buf.definition, opts)

				opts.desc = "Go to Implementation"
				keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

				opts.desc = "Go to Type Definition"
				keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)

				opts.desc = "Hover Documentation"
				keymap.set("n", "K", vim.lsp.buf.hover, opts)

				opts.desc = "Signature Help"
				keymap.set("n", "gK", vim.lsp.buf.signature_help, opts)

				opts.desc = "Signature Help"
				keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)

				-- Code actions
				opts.desc = "Code Action"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

				opts.desc = "Rename Symbol"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

				opts.desc = "Format Buffer"
				keymap.set({ "n", "v" }, "<leader>cf", function()
					vim.lsp.buf.format({ async = true })
				end, opts)

				-- Diagnostics
				opts.desc = "Line Diagnostics"
				keymap.set("n", "<leader>cd", vim.diagnostic.open_float, opts)

				opts.desc = "Go to Previous Diagnostic"
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

				opts.desc = "Go to Next Diagnostic"
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

				-- Utility
				opts.desc = "LSP Info"
				keymap.set("n", "<leader>cl", "<cmd>LspInfo<cr>", opts)

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", "<cmd>LspRestart<cr>", opts)
			end,
		})

		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Setup mason-lspconfig with handlers (v2.0+ syntax)
		mason_lspconfig.setup({
			ensure_installed = {
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"lua_ls",
				"emmet_ls",
				"pyright",
				"zls",
				"ansiblels",
				"nil_ls",
				"yamlls",
				"helm_ls",
				"marksman",
			},
			automatic_installation = true,
			handlers = {
				-- default handler for installed servers
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,
				["emmet_ls"] = function()
					lspconfig["emmet_ls"].setup({
						capabilities = capabilities,
						filetypes = {
							"html",
							"typescriptreact",
							"javascriptreact",
							"css",
							"sass",
							"scss",
							"less",
							"svelte",
						},
					})
				end,
				["lua_ls"] = function()
					lspconfig["lua_ls"].setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								-- make the language server recognize "vim" global
								diagnostics = {
									globals = { "vim" },
								},
								completion = {
									callSnippet = "Replace",
								},
							},
						},
					})
				end,
				["ansiblels"] = function()
					lspconfig["ansiblels"].setup({
						capabilities = capabilities,
						filetypes = { "yaml.ansible" },
						-- Don't attach to helm files
						on_attach = function(client, bufnr)
							if vim.bo[bufnr].filetype == "helm" then
								vim.lsp.stop_client(client.id)
							end
						end,
						settings = {
							ansible = {
								python = {
									interpreterPath = "python3",
								},
								ansible = {
									path = "ansible",
								},
								executionEnvironment = {
									enabled = false,
								},
								validation = {
									enabled = true,
									lint = {
										enabled = true,
										path = "ansible-lint",
									},
								},
							},
						},
					})
				end,
				["yamlls"] = function()
					lspconfig["yamlls"].setup({
						capabilities = capabilities,
						settings = {
							yaml = {
								-- Disable auto schema download — fetching schemas for 1900+ YAML files
								-- causes severe startup freeze in large infra repos
								schemaStore = {
									enable = false,
									url = "",
								},
								schemas = require("schemastore").yaml.schemas(),
							},
						},
						-- Don't attach to yaml.ansible files
						on_attach = function(client, bufnr)
							if vim.bo[bufnr].filetype == "yaml.ansible" then
								vim.lsp.stop_client(client.id)
							end
						end,
					})
				end,
				["helm_ls"] = function()
					lspconfig["helm_ls"].setup({
						capabilities = capabilities,
						filetypes = { "helm" },
						settings = {
							["helm-ls"] = {
								yamlls = {
									enabled = true,
									path = "yaml-language-server",
									config = {
										schemas = {
											kubernetes = "templates/**",
										},
										validate = true,
										hover = true,
										completion = true,
									},
								},
							},
						},
					})
				end,
			}, -- end handlers
		}) -- end mason_lspconfig.setup
	end,
}
