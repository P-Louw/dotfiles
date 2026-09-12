return {
	-- Active colorscheme.
	{
		"P-Louw/wulingyuan-nvim",
		name = "wulingyuan",
		lazy = false,
		priority = 1000,
		config = function()
			require("wulingyuan").setup({
				styles = { comments = { italic = true } },
				on_highlights = function(hl, c)
					-- Bright theme white for lazygit's dim [241] markers.
					-- Referenced by name from the snacks lazygit theme (ui.lua).
					hl.LazygitDimBright = { fg = c.base07 }

					-- Highlight the whole Telescope selection row instead of
					-- indenting it (indenting relies on a wider caret, which
					-- accumulates shift on redraw).
					hl.TelescopeSelection = { bg = c.base02, bold = true }
					hl.TelescopeSelectionCaret = { fg = c.green, bg = c.base02 }
				end,
			})
			vim.cmd("colorscheme wulingyuan")
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
	},
}
