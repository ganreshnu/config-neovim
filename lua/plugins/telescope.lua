-- telescope.lua
--
-- Telescope plugin.

return {
	-- Fuzzy Finder (files, lsp, etc)
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
		},
		cmd = "Telescope",
		opts = {
			defaults = {
				mappings = {
					i = {
						['<C-u>'] = false,
						['<C-d>'] = false,
					},
				},
			},
		},
		init = function()
			require("keymaps").telescope()
		end,
		config = function(_, opts)
			require("telescope").setup(opts)
			-- Enable telescope fzf native, if installed
			pcall(require('telescope').load_extension, 'fzf')
		end,
	},
}
