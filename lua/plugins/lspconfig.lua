-- lspconfig.lua
--
-- nvim-lspconfig plugin.

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Manage LSPs in stdpath
			'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

			-- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
			-- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
		},
		init = function()
			-- require("core.utils").lazy_load "nvim-lspconfig"
		end,
		config = function()
			-- require "plugins.configs.lspconfig"
		end,
	},
}
