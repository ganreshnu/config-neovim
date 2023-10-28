return {
	{
		"stevearc/conform.nvim",
		opts = {
			log_level = vim.log.levels.ERROR,
			notify_on_error = true,
			formatters_by_ft = {
				["*"] = { "codespell" },
				["_"] = { "trim_whitespace" },
			},
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 500,
			},
		},
		config = function(_, opts)
			for _, lang in ipairs(languages) do
				for _, formatter in ipairs(lang.formatters) do
					for _, filetype in ipairs(lang.filetypes) do
						opts.formatters_by_ft[filetype] = { formatter }
					end
				end
			end
			vim.print(opts)
			require("conform").setup(opts)
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},
}
