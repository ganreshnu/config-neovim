--
-- my nvim conf
--

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
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
-- vim.opt.clipboard = "unnamedplus"
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
vim.opt.completeopt = { "menuone", "longest" }

--
-- installed languages
--
local languages = {
	{
		filetypes = { "lua" },
		lsp_servers = {
			["lua-language-server"] = {
				"lua_ls",
			},
		},
	},
	{
		filetypes = { "json" },
		lsp_servers = {
			["json-lsp"] = {
				"jsonls",
			},
		},
	},
	{
		filetypes = { "cmake" },
		lsp_servers = {
			["neocmakelsp"] = {
				"neocmake",
			},
		},
	},
	{
		filetypes = { "c", "cpp" },
		lsp_servers = {
			-- clangd requires unzip
			["clangd"] = {
				cmd = { "clangd", "--offset-encoding=utf-16" },
			},
		},
		debug_adapters = {
			["cpptools"] = function(callback, config)
				-- see :h *dap-adapter*
				callback({
					id = "cppdbg", -- the dap adapterID
					type = "executable",
					command = require("mason-core.path").bin_prefix("OpenDebugAD7"),
				})
			end,
			["codelldb"] = function(callback, config)
				callback({
					type = "server",
					port = "${port}",
					executable = {
						command = require("mason-core.path").bin_prefix("codelldb"),
						args = { "--port", "${port}" },
					},
				})
			end,
		},
	},
	{
		filetypes = { "python" },
		lsp_servers = {
			["pyright"] = {},
		},
		debug_adapters = {
			["debugpy"] = function(callback, config)
				callback({
					type = "server",
					port = "${port}",
					executable = {
						command = require("mason-core.path").bin_prefix("debugpy-adapter"),
						args = { "--port", "${port}" },
					},
				})
			end,
		},
	},
	{
		filetypes = { "sh", "bash" },
		lsp_servers = {
			["bash-language-server"] = {
				"bashls",
			},
			["shfmt"] = {},
		},
		debug_adapters = {
			["bash-debug-adapter"] = function(callback, config)
				config.pathBashdbLib = require("mason-core.path").package_prefix("bash-debug-adapter")
						.. "/extension/bashdb_dir"
				config.pathBashdb = config.pathBashdbLib .. "/bashdb"
				config.pathBash = "bash"
				config.pathCat = "cat"
				config.pathMkfifo = "mkfifo"
				config.pathPkill = "pkill"
				config.env = {}
				config.args = {}

				callback({
					type = "executable",
					command = require("mason-core.path").bin_prefix("bash-debug-adapter"),
					args = { "start" },
				})
			end,
		},
	},
	{
		-- note: debugging perl requires installing PadWalker
		-- $ cpan PadWalker
		filetypes = { "perl" },
		lsp_servers = {
			["perlnavigator"] = {
				cmd = { "perlnavigator", "--stdio" },
			},
		},
		debug_adapters = {
			["perl-debug-adapter"] = function(callback, config)
				callback({
					type = "executable",
					command = require("mason-core.path").bin_prefix("perl-debug-adapter"),
					args = {},
				})
			end,
		},
	},
	{
		filetypes = { "awk" },
		lsp_servers = {
			["awk-language-server"] = {
				"awk_ls",
			},
		},
	},
	{
		filetypes = { "javascript", "typescript" },
		lsp_servers = {
			["typescript-language-server"] = {
				"tsserver",
			},
		},
		debug_adapters = {
			["js-debug-adapter"] = function(callback, config)
				callback({
					id = "pwa-node",
					type = "server",
					port = "${port}",
					executable = {
						command = require("mason-core.path").bin_prefix("js-debug-adapter"),
						args = { "${port}" },
					},
				})
			end,
		},
	},
	{
		filetypes = { "rust" },
		lsp_servers = {
			["rust-analyzer"] = {
				"rust_analyzer",
			},
		},
		debug_adapters = {
			["codelldb"] = function(callback, config)
				callback({
					type = "server",
					port = "${port}",
					executable = {
						command = require("mason-core.path").bin_prefix("codelldb"),
						args = { "--port", "${port}" },
					},
				})
			end,
		},
	},
	{
		filetypes = { "toml" },
		lsp_servers = {
			["taplo"] = {
				"taplo"
			},
		}
	},
	{
		filetypes = { "ts" },
		lsp_servers = {
			["typescript-language-server"] = {
				"ts_ls"
			},
		}
	}
}

-- set the languages to a global
-- note that metatables don't seem to work with vim.g
local Language = { filetypes = {}, lsp_servers = {}, debug_adapters = {} }
_G.languages = vim.tbl_map(function(lang)
	return setmetatable(lang, { __index = Language })
end, languages)

-- disable some default providers
for _, provider in ipairs({ "node", "perl", "python3", "ruby" }) do
	vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- setup our basic keymaps
require("keymaps").basic()

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require("lazy").setup("plugins")

-- set the colorscheme
vim.cmd('colorscheme ansi')

