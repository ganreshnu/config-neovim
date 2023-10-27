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
			ensure_installed = { 'comment' },
			-- autoinstall doesn't seem to work
			auto_install = true,
			highlight = { enable = true, },
			indent = { enable = true },
			incremental_selection = { enable = true },
		},
		config = function(_, opts)
			-- check lsp/debug filetypes against available treesitter parsers
			local available_parsers = require('nvim-treesitter.parsers').available_parsers()
			for _, lang in ipairs(languages) do
				local filetypes = vim.tbl_filter(function(filetype)
					return vim.tbl_contains(available_parsers, filetype)
				end, lang.filetypes)
				vim.list_extend(opts.ensure_installed, filetypes)
			end

			vim.defer_fn(function()
				require('nvim-treesitter.configs').setup(opts)
			end, 0)
		end
	}
}
