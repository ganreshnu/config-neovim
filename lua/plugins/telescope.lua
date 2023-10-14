-- telescope.lua
--
-- Telescope plugin.

return {
	-- Fuzzy Finder (files, lsp, etc)
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
		},
		cmd = "Telescope",
		opts = {
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				}
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
