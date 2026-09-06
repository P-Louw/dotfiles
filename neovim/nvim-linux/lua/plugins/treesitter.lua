return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		require("nvim-treesitter").setup()

		-- autotag is no longer a treesitter option on the main branch;
		-- it configures itself.
		require("nvim-ts-autotag").setup()

		-- Parsers to keep installed. install() is async and idempotent.
		require("nvim-treesitter").install({
			"json",
			"javascript",
			"typescript",
			"tsx",
			"yaml",
			"html",
			"css",
			"scss",
			"markdown",
			"markdown_inline",
			"bash",
			"lua",
			"vim",
			"regex",
			"dockerfile",
			"gitignore",
			"c",
			"rust",
			"python",
			"zig",
			"norg",
			"svelte",
			"typst",
			"vue",
			"helm",
		})

		-- Enable highlighting (and treesitter indent) per buffer for any
		-- filetype whose parser is installed. Parsers that aren't installed
		-- are skipped silently.
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(ev)
				local ok = pcall(vim.treesitter.start, ev.buf)
				if ok then
					vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end
			end,
		})
	end,
}
