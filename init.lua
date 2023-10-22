--
-- my nvim conf
--

-- installed languages
vim.g.languages = {
  {
    filetypes = { 'cmake' },
    lsp_servers = { neocmake = {} },
  },
  {
    filetypes = { 'c', 'cpp' },
    lsp_servers = { clangd = {} },
    debug_adapters = {
      cpptools = function()
        -- see :h *dap-adapter*
        return {
          id = 'cppdbg', -- the dap adapterID
          type = 'executable',
          command = require('mason-core.path').bin_prefix('OpenDebugAD7'),
        }
      end,
      codelldb = function()
        return {
          id = 'codelldb',
          type = 'server',
          port = "${port}",
          executable = {
            command = require('mason-core.path').bin_prefix('codelldb'),
            args = { '--port', '${port}' },
          }
        }
      end,
    },
  },
  {
    filetypes = { 'lua' },
    lsp_servers = { lua_ls = {} },
  },
  {
    filetypes = { 'python' },
    lsp_servers = { pyright = {} },
    -- debug_adapters = { python = {} },
  },
  {
    filetypes = { 'bash' },
    lsp_servers = { bashls = { filetypes = { 'sh', 'bash' } } },
    debug_adapters = {
      bash = function()
        return {
          id = 'bash',
          type = 'executable',
          command = require('mason-core.path').bin_prefix('bash-language-server')
        }
      end,
    },
  },
  {
    filetypes = { 'json' },
    lsp_servers = { jsonls = {} },
  },
  {
    filetypes = { 'perl' },
    lsp_servers = { perlnavigator = {} },
    -- debug_adapters = { perl = {} }, -- NOT in mason-nvim-dap
  },
  {
    filetypes = { 'awk' },
    lsp_servers = { awk_ls = {} },
  },
  {
    filetypes = { 'javascript', 'typescript' },
    lsp_servers = { tsserver = {} },
    -- debug_adapters = { js = {} },
  },
  {
    filetypes = { 'rust' },
    lsp_servers = { rust_analyzer = {} },
    -- debug_adapters = { codelldb = {} },
  },
}

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
-- vim.g.maplocalleader = ','
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 1
vim.g.netrw_liststyle = 3

vim.opt.title = true

-- [[ Setting options ]]
-- See `:help vim.opt`
vim.opt.laststatus = 2
vim.opt.showmode = false
vim.opt.ruler = true

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'
vim.opt.cursorline = true

-- Set tabstop to something reasonable
vim.opt.expandtab = false
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- vim.opt.fillchars = { eob = " " }

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Enable mouse mode
vim.opt.mouse = 'a'

-- Set highlight on search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Make line numbers default
vim.opt.number = true
vim.opt.numberwidth = 2
-- Set relative line numbers
vim.opt.relativenumber = true

vim.opt.signcolumn = 'number'
vim.opt.splitbelow = true
vim.opt.splitright = true
-- NOTE: You should make sure your terminal supports this
vim.opt.termguicolors = true
-- Enable break indent
vim.opt.breakindent = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Save undo history
vim.opt.undofile = true

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.whichwrap:append "<>[]hl"

vim.opt.scrolloff = 6
vim.opt.sidescrolloff = 6

vim.opt.errorbells = false

-- Set completeopt to have a better completion experience
vim.opt.completeopt = { 'menuone', 'longest' }


-- disable some default providers
for _, provider in ipairs { "node", "perl", "python3", "ruby" } do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- set the treesitter languages and lsp server options
local function combine_language_property(property)
  local result = {}
  for _, language in ipairs(vim.g.languages) do
    if language[property] == nil then goto continue end
    if vim.tbl_islist(language[property]) then
      for _, v in ipairs(language[property]) do
        table.insert(result, v)
      end
    else
      result = vim.tbl_extend("error", result, language[property])
    end
    ::continue::
  end
  return result
end
vim.g.treesitter_ensure_installed = combine_language_property('filetypes')
vim.g.lsp_servers = combine_language_property('lsp_servers')
vim.g.debug_adapters = combine_language_property('debug_adapters')

-- setup our basic keymaps
require("keymaps").basic()

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup('plugins')

-- set the colorscheme
-- vim.cmd('colorscheme base16-default-dark')
vim.cmd('colorscheme base16-ia-dark')

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
