-- lspconfig.lua
--
-- nvim-lspconfig plugin.

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Manage LSPs in stdpath
			{
				'williamboman/mason-lspconfig.nvim',
				dependencies = { 'williamboman/mason.nvim' },
				opts = {
					ensure_installed = { 'lua_ls' },
				},
			},

			-- Useful status updates for LSP
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
			-- Additional lua configuration, makes nvim stuff amazing!
			{ 'folke/neodev.nvim', opts = {} },
			'hrsh7th/nvim-cmp'
		},
		config = function()
			-- setup the client capabilities
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

			-- run when the buffer is attached
			local on_attach = function(_, bufnr)
				require("keymaps").lspconfig(bufnr)
			end

			-- setup the configuration handlers
			require("mason-lspconfig").setup_handlers {
				function(server_name)
					require("lspconfig")[server_name].setup {
						capabilities = capabilities,
						on_attach = on_attach,
						settings = vim.g.lsp_servers[server_name] or {},
						filetypes = (vim.g.lsp_servers[server_name] or {}).filetypes,
					}
				end
			}
		end,
	},
}
