--
-- basic plugins
--

local keymaps = require('keymaps')
return {
	-- Useful plugin to show you pending keybinds.
	{
		'folke/which-key.nvim',
		dependencies = {
			{
				"nvim-tree/nvim-web-devicons",
				opts = {},
			},
		},
		config = function(_, opts)
			require('which-key').setup(opts)
			keymaps['which-key']()
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗"
				}
			}
		},
	},
	{
		'mfussenegger/nvim-dap',
		config = function(_, _)
			-- require('dap').set_log_level('TRACE')
			keymaps['dap']()
		end
	},
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
	},
	{
		'Saghen/blink.cmp',
		dependencies = { 'rafamadriz/friendly-snippets' },
		version = '1.*',
		---@module "blink.cmp"
		---@type blink.cmp.Config
		opts = {
			keymap = { preset = 'default' },
			appearance = {
				nerd_font_variant = 'mono'
			},
			completion = {
				list = {
					selection = { preselect = false, auto_insert = false },
				},
			},
			sources = {
				default = { 'lsp', 'path', 'snippets', 'buffer' },
			},
		},
	},
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = {
			{
				"nvim-tree/nvim-web-devicons",
				opts = {},
			},
		},
		-- or if using mini.icons/mini.nvim
		-- dependencies = { "nvim-mini/mini.icons" },
		opts = {},
		config = function(_, opts)
			require('fzf-lua').setup(opts)
			keymaps['fzf-lua']()
		end
	},
	{
		"christoomey/vim-tmux-navigator",
	},
	{
		'rebelot/kanagawa.nvim',
		opts = {
			transparent = true,
			background = {
				dark = "dragon",
				light = "wave"
			},
		},
		config = function (_, opts)
			require('kanagawa').setup(opts)

			-- set the colorscheme
			vim.cmd('colorscheme kanagawa')
		end
	},
	{
		'nvim-mini/mini.ai',
		version = '*',
		opts = {},
	},
}
