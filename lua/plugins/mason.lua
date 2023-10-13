-- mason.lua
--
-- Mason plugin.

return {
	{
		"williamboman/mason.nvim",
		opts = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗"
			}
		},
	},
}
