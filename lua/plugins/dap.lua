--
-- debug adapter
--
return {
	{
		'mfussenegger/nvim-dap',
		dependencies = {
			-- Installs the debug adapters for you
			-- 'jay-babu/mason-nvim-dap.nvim',
			'williamboman/mason.nvim',
		},
		config = function()
			local dap = require('dap')
			dap.set_log_level('TRACE')

			for _, lang in ipairs(languages) do
				for name, adapter in pairs(lang.debug_adapters) do
					-- see if adapter is installed
					local package = require('mason-registry').get_package(name)
					if package:is_installed() then
						dap.adapters[name] = adapter
						-- dap.listeners.before.launch
						require('dap.ext.vscode').load_launchjs(nil, { [name] = lang.filetypes })
					elseif require('mason-dependencies').can_install(name) then
						vim.print('dap install ' .. name)
						package:install()
					end
				end
			end
		end,
	},
	{
		-- Creates a beautiful debugger UI
		'rcarriga/nvim-dap-ui',
		dependencies = {
			'mfussenegger/nvim-dap',
		},
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
}
