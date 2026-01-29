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

	vim.keymap.set('n', '<leader>t', "<cmd>25Lex<CR>", { desc = "workspace [t]reeview" })
	vim.keymap.set('n', '<leader>m', "<cmd>make<CR>", { desc = "[m]ake project" })

	-- Diagnostic keymaps
	vim.keymap.set('n', '[d', function() vim.diagnostic.jump( {count=-1, float=true} ) end, { desc = 'Go to previous diagnostic message' })
	vim.keymap.set('n', ']d', function() vim.diagnostic.jump( {count=1, float=true} ) end, { desc = 'Go to next diagnostic message' })
	vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
	vim.keymap.set('n', '<leader>l', vim.diagnostic.setloclist, { desc = 'Open file diagnostics' })
	vim.keymap.set('n', '<leader>q', vim.diagnostic.setqflist, { desc = 'Open all diagnostics' })
	vim.keymap.set('n', '<leader>xs', function() vim.cmd(":split term://bash") vim.cmd("startinsert") end, { desc = 'Open terminal split' })
	vim.keymap.set('n', '<leader>xv', function() vim.cmd(":vsplit term://bash") vim.cmd("startinsert") end, { desc = 'Open terminal vertical' })
end

--
-- which-key
--
M['which-key'] = function()
	vim.keymap.set('n', "<leader>?", function() require('which-key').show({ global = false }) end, { desc = "Buffer local keymaps" })
end

--
-- fzf-lua
--
M['fzf-lua'] = function()
	local wk = require('which-key')

	wk.add({ '<leader>f', group = 'find' })
	vim.keymap.set('n', "<leader>fa", require('fzf-lua').global, { desc = "[f]ind in [a]ll places" })
	vim.keymap.set('n', "<leader>fi", require('fzf-lua').grep, { desc = "[f]ind [i]n file" })
end

--
-- dap
--
M.dap = function()
	local dap = require('dap')
	local widgets = require('dap.ui.widgets')
	local wk = require('which-key')

	vim.keymap.set('n', '<F5>', dap.continue, { desc = "continue" })
	vim.keymap.set('n', '<F10>', dap.step_over, { desc = "step over" })
	vim.keymap.set('n', '<F11>', dap.step_into, { desc = "step into" })
	vim.keymap.set('n', '<F12>', dap.step_out, { desc = "step out" })
	vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = "toggle breakpoint" })
	vim.keymap.set('n', '<leader>B', dap.set_breakpoint, { desc = "set breakpoint" })
	wk.add({ '<leader>d', group = "DAP" })
	vim.keymap.set('n', '<leader>dp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, { desc = "set logpoint" })
	vim.keymap.set('n', '<leader>dr', dap.repl.open, { desc = "open REPL" })
	vim.keymap.set('n', '<leader>dl', dap.run_last, { desc = "run last" })
	vim.keymap.set({'n', 'v'}, '<Leader>dh', widgets.hover, { desc = "dap hover" })
	vim.keymap.set({'n', 'v'}, '<Leader>dp', widgets.preview, { desc = "dap preview" })
	vim.keymap.set('n', '<Leader>df', function()
		widgets.centered_float(widgets.frames)
	end, { desc = "dap frames" })
	vim.keymap.set('n', '<Leader>ds', function()
		widgets.centered_float(widgets.scopes)
	end, { desc = "dap scopes" })
end

return M
