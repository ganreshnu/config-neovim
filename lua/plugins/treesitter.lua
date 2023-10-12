-- treesitter.lua
--
-- Treesitter plugin.
return {
	{
		-- Highlight, edit, and navigate code
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects',
		},
		build = ':TSUpdate',
		opts = {
			-- Add languages to be installed here that you want installed for treesitter
			ensure_installed = { 'lua', 'python', 'tsx',
				'typescript',
				'javascript',
				'vimdoc',
				'vim', 'bash', 'cmake' },

			highlight = { enable = true, use_languagetree = true, },
			indent = { enable = true },
			incremental_selection = { enable = true },
		},
		config = function(_, opts)
			vim.defer_fn(function()
				require('nvim-treesitter.configs').setup(opts)
			end, 0)
		end
	}
}
