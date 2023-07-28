return {
	'Mofiqul/vscode.nvim',
	config = function()
		require('vscode').setup({
			transparent = true,
			italic_comments = true
		})
		require('vscode').load()
		require('lualine').setup({
			options = {
				theme = 'vscode'
			},
		})
		vim.cmd.colorscheme 'vscode'
	end,
}
