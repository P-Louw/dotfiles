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
