-- lspconfig.lua
--
-- nvim-lspconfig plugin.

return {
	{
		"neovim/nvim-lspconfig",
		init = function()
			-- require("core.utils").lazy_load "nvim-lspconfig"
		end,
		config = function()
			-- require "plugins.configs.lspconfig"
		end,
		cond = false,
	},
}
