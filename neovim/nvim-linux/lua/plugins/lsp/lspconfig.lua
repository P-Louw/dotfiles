return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		"williamboman/mason.nvim",
		{ "williamboman/mason-lspconfig.nvim", config = function() end },
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

				-- set keybinds
				opts.desc = "Show LSP references"
				keymap.set("n", "gR", "<leader>Telescope lsp_references<CR>", opts)

				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

				opts.desc = "Show LSP definitions"
				keymap.set("n", "gd", "<leader>Telescope lsp_definitions<CR>", opts)

				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", "<leader>Telescope lsp_implementations<CR>", opts)

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<leader>Telescope lsp_type_definitions<CR>", opts)

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts)

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
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
								vim.lsp.buf_detach_client(bufnr, client.id)
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
								schemas = {
									["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
									["https://json.schemastore.org/github-action.json"] = "/.github/action.{yml,yaml}",
									["https://json.schemastore.org/ansible-stable-2.9.json"] = "roles/tasks/*.{yml,yaml}",
								},
							},
						},
						-- Don't attach to yaml.ansible files
						on_attach = function(client, bufnr)
							if vim.bo[bufnr].filetype == "yaml.ansible" then
								vim.lsp.buf_detach_client(bufnr, client.id)
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
