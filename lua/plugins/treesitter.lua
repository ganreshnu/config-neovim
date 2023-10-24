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
		cond = function()
			for _, compiler in ipairs({ "cc", "gcc", "clang", "cl", "zig" }) do
				if vim.fn.executable(compiler) == 1 then
					return true
				end
			end
			return false
		end,
		opts = {
			-- Add languages to be installed here that you want installed for treesitter
			ensure_installed = vim.g.treesitter_ensure_installed,

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
