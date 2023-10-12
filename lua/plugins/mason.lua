-- mason.lua
--
-- Mason plugin.

return {
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
		config = true,
--]]		config = function(_, opts)
			-- dofile(vim.g.base46_cache .. "mason")
--			require("mason").setup(opts)

--		end,
	},
}
