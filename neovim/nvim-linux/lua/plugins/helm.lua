return {
	"qvalentin/helm-ls.nvim",
	ft = "helm",
	opts = {
		-- Conceal template values with actual values from values.yaml
		conceal_templates = { enabled = true },
		-- Show indentation hints for nested template blocks
		indent_hints = {
			enabled = true,
			only_for_current_line = true,
		},
		-- Highlight Helm template blocks
		action_highlight = { enabled = true },
	},
}
