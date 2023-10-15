local M = {}

M.basic = function()
	-- [[ Basic Keymaps ]]

	-- Keymaps for better default experience
	-- See `:help vim.keymap.set()`
	vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

	-- Remap for dealing with word wrap
	vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
	vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

	-- Quickly exit from insert mode
	vim.keymap.set('i', 'kj', '<ESC>', { desc = 'Return to normal mode' })

	vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Left window' })
	vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Right window' })
	vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Down window' })
	vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Up window' })

	vim.keymap.set('n', '<leader>t', "<cmd>25Lex<CR>", { desc = "file [t]reeview" })

	-- Diagnostic keymaps
	vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
	vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
	vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
	vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
end

M.telescope = function()
	vim.keymap.set('n', "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "[f]ind [f]iles" })
	vim.keymap.set('n', "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
		{ desc = "[f]ind [a]ll files" })
	vim.keymap.set('n', "<leader>fw", "<cmd>Telescope git_files<CR>", { desc = "[f]ind [w]orkspace files" })
	vim.keymap.set('n', "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "[f]ind with [g]rep" })
	vim.keymap.set('n', "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "[f]ind [b]uffers" })
	vim.keymap.set('n', "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "[f]ind in [h]elp" })
	vim.keymap.set('n', "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "[f]ind [o]ld files" })
	vim.keymap.set('n', "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "buffer [f]ind fu[z]zy" })
end

M.lspconfig = function(bufnr)
	local nmap = function(keys, func, desc)
		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end

	nmap("K", vim.lsp.buf.hover, "type information")
	nmap("gD", vim.lsp.buf.declaration, "goto declaration")
	nmap("gd", vim.lsp.buf.definition, "goto definition")
	nmap("gi", vim.lsp.buf.implementation, "goto implementation")
	nmap("<leader>F", vim.lsp.buf.format, "format buffer")
end

M.cmp = function()
	local cmp = require('cmp')
	local luasnip = require('luasnip')

	return cmp.mapping.preset.insert({
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
		-- ['<C-Space>'] = cmp.mapping.complete {},
		["<C-e>"] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
				cmp.close()
			elseif luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 's' }),
		--[[ ['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.mapping.close()
			elseif luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }), ]]
	})
end

M.comment = function()
	return {
		{ "gcc", mode = "n",          desc = "Comment toggle current line" },
		{ "gc",  mode = { "n", "o" }, desc = "Comment toggle linewise" },
		{ "gc",  mode = "x",          desc = "Comment toggle linewise (visual)" },
		{ "gbc", mode = "n",          desc = "Comment toggle current block" },
		{ "gb",  mode = { "n", "o" }, desc = "Comment toggle blockwise" },
		{ "gb",  mode = "x",          desc = "Comment toggle blockwise (visual)" },
	}
end

return M
