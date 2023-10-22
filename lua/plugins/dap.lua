--
-- debug adapter
--
return {
	{
		'mfussenegger/nvim-dap',
		dependencies = {
			-- Creates a beautiful debugger UI
			'rcarriga/nvim-dap-ui',
			-- Installs the debug adapters for you
			-- 'jay-babu/mason-nvim-dap.nvim',
			'williamboman/mason.nvim',
		},
		config = function()
			local dap = require('dap')
			-- dap.set_log_level('TRACE')
			for _, lang in ipairs(vim.g.languages) do
				for name, adapter in pairs(lang.debug_adapters or {}) do
					-- see if adapter is installed
					dap.adapters[name] = adapter()
					local name_to_filetypes = {}
					name_to_filetypes[name] = lang.filetypes
					require('dap.ext.vscode').load_launchjs(nil, name_to_filetypes)
				end
			end
		end,
	},
	{
		'rcarriga/nvim-dap-ui',
		opts = {},
		config = function(_, opts)
			local dapui = require('dapui')
			dapui.setup(opts)

			local dap = require('dap')
			dap.listeners.after.event_initialized['dapui_config'] = dapui.open
			dap.listeners.before.event_terminated['dapui_config'] = dapui.close
			dap.listeners.before.event_exited['dapui_config'] = dapui.close

			-- set keymaps
			require('keymaps').dap()
		end,
	},
	--[[ {
		'jay-babu/mason-nvim-dap.nvim',
		cond = false,
		dependencies = {
			'williamboman/mason.nvim',
		},
		opts = {
			-- You'll need to check that you have the required things installed
			-- online, please don't ask me how to install them :)
			ensure_installed = vim.tbl_keys(vim.g.debug_adapters),

			-- You can provide additional configuration to the handlers,
			-- see mason-nvim-dap README for more information
			handlers = {
				function(config)
					require('mason-nvim-dap').default_setup(config)
				end,
				cppdbg = function(config)

					require('mason-nvim-dap').default_setup(config)
				end,
			},
		},
	}, ]]
}
