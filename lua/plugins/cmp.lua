return {
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
			},
			-- cmp sources plugins
			{
				-- "hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"saadparwaiz1/cmp_luasnip",
			},
		},
		opts = {
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body)
				end,
			},
			sources = {
				-- { name = "nvim_lua" },
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = "luasnip" },
			},
		},
		config = function(_, opts)
			opts.mapping = require('keymaps').cmp()
			require("cmp").setup(opts)
		end,
	},
}
