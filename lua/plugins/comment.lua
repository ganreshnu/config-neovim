return {
	"numToStr/Comment.nvim",
	keys = require("keymaps").comment(),
	config = function(_, opts)
		require("Comment").setup(opts)
	end,
}
