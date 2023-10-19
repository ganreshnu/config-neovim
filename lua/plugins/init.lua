--
-- basic plugins
--

return {
	-- Useful plugin to show you pending keybinds.
	{
		'folke/which-key.nvim',
		lazy = false,
		opts = {},
	},
	{
		'ggandor/leap.nvim',
		opts = {},
		config = function(_, opts)
			local leap = require('leap')
			vim.tbl_deep_extend("force", leap.opts, opts)
			leap.add_default_mappings()
		end
	},
	{
		"numToStr/Comment.nvim",
		opts = {},
	},
}
