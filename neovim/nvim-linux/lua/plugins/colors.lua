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
			end,
		})
		vim.cmd("colorscheme wulingyuan")
	end
  },

  -- Kept installed for manual switching: `:colorscheme rose-pine`.
  -- lazy = true means it's downloaded but not loaded until you select it.
  {
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = true,
  },
}
