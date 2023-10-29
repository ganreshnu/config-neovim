return {
	"mfussenegger/nvim-lint",
	cond = false,
	opts = {},
	config = function(_, opts)
		require("lint").setup(opts)
	end,
}
