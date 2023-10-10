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


  -- Diagnostic keymaps
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
end

M.telescope = function()
  vim.keymap.set('n', "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
  vim.keymap.set('n', "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
    { desc = "Find all" })
  vim.keymap.set('n', "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
  vim.keymap.set('n', "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
  vim.keymap.set('n', "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help page" })
  vim.keymap.set('n', "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Find oldfiles" })
  vim.keymap.set('n', "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Find in current buffer" })
end

return M
