--
-- my nvim conf
--

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.g.netrw_banner = 0
vim.g.netrw_winsize = 17
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
vim.opt.clipboard = "unnamedplus"
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
vim.opt.mouse = "a"

-- Set highlight on search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Make line numbers default
vim.opt.number = true
vim.opt.numberwidth = 2
-- Set relative line numbers
vim.opt.relativenumber = true

vim.opt.signcolumn = "number"
vim.opt.splitbelow = true
vim.opt.splitright = true
-- NOTE: You should make sure your terminal supports this
vim.opt.termguicolors = false
-- Enable break indent
vim.opt.breakindent = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Save undo history
vim.opt.undofile = true

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.whichwrap:append("<>[]hl")

vim.opt.scrolloff = 6
vim.opt.sidescrolloff = 6

vim.opt.errorbells = false

-- Set completeopt to have a better completion experience
-- vim.opt.completeopt = { "menuone", "longest", "noselect" }

--
-- Bootstrap lazy.nvim
--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	spec = {
		-- import the plugins lua module
		{ import = "plugins" },
	},
	install = { colorscheme = { "habamax" } },
	checker = { enabled = false },
	change_detection = { enabled = false },
	rocks = { enabled = false },
})

--
-- installed languages
--
local languages = {
	{
		"Lua",
		filetypes = { "lua" },
		lsp_servers = {
			{
				"lua-language-server",
				root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
				settings = {
					Lua = {
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
						},
						runtime = {
							version = 'LuaJIT'
						}
					}
				}
			},
		},
		debug_adapters = {
			{
				"local-lua-debugger-vscode",
				type = 'executable',
				command = 'node',
				args = { 'local-lua-debugger-vscode/extension/debugAdapter.js' },
			},
		},
		-- the 'lua' grammar is installed by neovim
		grammars = { "luadoc" },
	},
	{
		"Shell Script",
		filetypes = { "sh", "bash" },
		lsp_servers = {
			{
				"bash-language-server",
				cmd = { 'bash-language-server', 'start' },
				settings = {
					bashIde = {
						-- Glob pattern for finding and parsing shell script files in the workspace.
						-- Used by the background analysis features across files.

						-- Prevent recursive scanning which will cause issues when opening a file
						-- directly in the home directory (e.g. ~/foo.sh).
						--
						-- Default upstream pattern is "**/*@(.sh|.inc|.bash|.command)".
						globPattern = vim.env.GLOB_PATTERN or '*@(.sh|.inc|.bash|.command)',
					},
				},
			},
		},
		debug_adapters = {
			{
				"bash-debug-adapter",
				type = "executable",
				command = "bash-debug-adapter",
				-- args = { "start" },
			},
		},
		grammars = { 'bash' }
	},
	{
		"JSON",
		filetypes = { "json", "jsonc" },
		lsp_servers = {
			{
				"json-lsp",
				cmd = { "vscode-json-language-server", '--stdio' },
				settings = {},
			},
		},
		grammars = { 'json' }
	},
	{
		"CMake",
		filetypes = { "cmake" },
		lsp_servers = {
			{
				"neocmakelsp",
				cmd = { "neocmakelsp", "stdio" },
			},
		},
		grammars = { 'cmake' }
	},
	{
		"C and C++",
		filetypes = { "c", "cpp" },
		lsp_servers = {
			{
				"clangd",
				cmd = { "clangd", "--background-index" },
				root_markers = { 'compile_commands.json' },
			},
		},
		debug_adapters = {
			{
				'gdb',
				type = 'executable',
				command = 'gdb',
				args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
			},
		},
		-- the 'c' grammar is installed by neovim
		grammars = { 'cpp' }
	},
	{
		"Python",
		filetypes = { "python" },
		lsp_servers = {
			{
				"basedpyright",
				cmd = { 'basedpyright-langserver', '--stdio' },
				root_markers = {
					'pyproject.toml',
					'pyrightconfig.json',
					'setup.py',
					'setup.cfg',
					'requirements.txt',
					'Pipfile',
					'.git',
				},
				settings = {},
			},
		},
		grammars = { 'python' },
	},
	{
		"TOML",
		filetypes = { "toml" },
		lsp_servers = {
			{
				'tombi',
				cmd = { 'tombi', 'lsp' },
				root_markers = { 'tombi.toml', 'pyproject.toml', '.git' },
			},
		},
		grammars = { 'toml' }
	},
	{
		"Markdown",
		filetypes = { 'markdown', 'markdown.mdx' },
		lsp_servers = {
			{
				'marksman',
				cmd = { "marksman", "server" },
				root_markers = { '.marksman.toml', '.git' },
			},
		},
		-- the grammar 'markdown' is installed by neovim
	},
}

local Language = { 'UNKNOWN', filetypes = {}, lsp_servers = {}, debug_adapters = {}, grammars = {} }
languages = vim.tbl_map(function(value)
	return setmetatable(value, { __index = Language })
end, languages)
function languages:find(ft)
	for _, language in ipairs(self) do
		if vim.list_contains(language.filetypes, ft) then
			return vim.deepcopy(language)
			-- return language
		end
	end
	return nil
end

--
-- set default lsp config
--
vim.lsp.config('*', {
	root_markers = { '.git' },
	-- capabilities = vim.lsp.protocol.make_client_capabilities(),
	capabilities = require('blink.cmp').get_lsp_capabilities(),
-- 	on_attach = function(client, bufnr)
-- 		vim.api.nvim_set_option_value('omnifunc', 'v:lua.vim.lsp.omnifunc', {buf = bufnr})
-- 		vim.api.nvim_set_option_value('tagfunc', 'v:lua.vim.lsp.tagfunc', {buf = bufnr})
-- 	end
})

for _, language in ipairs(languages) do
	local language_name = language[1]
	for _, server in ipairs(language.lsp_servers) do
		local mason_name = server[1]
		table.remove(server, 1)
		if not require('mason-registry').is_installed(mason_name) then goto continue end

		server.cmd = server.cmd or { mason_name }
		server.filetypes = language.filetypes
		vim.lsp.config(mason_name, server)
		vim.lsp.enable(mason_name)

		::continue::
	end
	for _, adapter in ipairs(language.debug_adapters) do
		local mason_name = adapter[1]
		table.remove(adapter, 1)
		if not (require('mason-registry').is_installed(mason_name) or vim.fn.executable(mason_name) == 1) then goto continue end

		adapter.command = adapter.command or mason_name
		require('dap').adapters[adapter.id or mason_name] = adapter

		::continue::
	end
	require('nvim-treesitter').install(language.grammars)
end

-- disable some default providers
for _, provider in ipairs({ "node", "perl", "python3", "ruby" }) do
	vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = 'Highlight when yanking text',
	group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- setup our basic keymaps
require("keymaps").basic()

