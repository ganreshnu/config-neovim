return {
	{
		'rebelot/kanagawa.nvim',
		opts = {
			transparent = true,
			background = {
				dark = "dragon",
				light = "wave"
			},
		},
		config = function (_, opts)
			require('kanagawa').setup(opts)

			-- set the colorscheme
			vim.cmd('colorscheme kanagawa')
		end
	}
}
