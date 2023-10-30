local M = {}

--
-- basic keybindings
--
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

--
-- telescope keybindings
--
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

--
-- lsp keybindings
--
M.lspconfig = function(bufnr)
	local nmap = function(keys, func, desc)
		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end

	nmap("K", vim.lsp.buf.hover, "type information")
	nmap("gD", vim.lsp.buf.declaration, "goto declaration")
	nmap("gd", vim.lsp.buf.definition, "goto definition")
	nmap("gi", vim.lsp.buf.implementation, "goto implementation")
	nmap("<leader>k", vim.lsp.buf.signature_help, "signature help")
	nmap("<leader>D", vim.lsp.buf.type_definition, "type definition")
	nmap("<leader>rn", vim.lsp.buf.rename, "rename")
	vim.keymap.set({ 'n', 'v' }, "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "code action" })
	nmap("gr", vim.lsp.buf.references, "goto references")
	nmap("<leader>F", function() vim.lsp.buf.format { async = true } end, "format buffer")
end

--
-- autocomplete keybindings
--
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
				cmp.mapping.select_next_item()
				cmp.mapping.close()
			elseif luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 's' }),
		-- FIXME: tab is not working
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

M.dap = function()
	local dap = require('dap')

	vim.keymap.set('n', '<F5>', dap.continue, { desc = "continue" })
	vim.keymap.set('n', '<F10>', dap.step_over, { desc = "step over" })
	vim.keymap.set('n', '<F11>', dap.step_into, { desc = "step into" })
	vim.keymap.set('n', '<F12>', dap.step_out, { desc = "step out" })
	vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = "toggle breakpoint" })
	vim.keymap.set('n', '<leader>B', dap.set_breakpoint, { desc = "set breakpoint" })
	vim.keymap.set('n', '<leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, { desc = "set logpoint" })
	vim.keymap.set('n', '<leader>dr', dap.repl.open, { desc = "open REPL" })
	vim.keymap.set('n', '<leader>dl', dap.run_last, { desc = "run last" })
end

return M
