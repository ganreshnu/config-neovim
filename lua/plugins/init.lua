--
-- basic plugins
--

return {
	-- Useful plugin to show you pending keybinds.
	{
		'folke/which-key.nvim',
		opts = {},
	},
	{
		'ggandor/leap.nvim',
		config = function()
			require('leap').add_default_mappings()
		end
	},
	{
		"numToStr/Comment.nvim",
		opts = {},
	},
}
