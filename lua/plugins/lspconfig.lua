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
				config = true,
			},

			-- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
			-- Additional lua configuration, makes nvim stuff amazing!
			{ 'folke/neodev.nvim', config = true },
			{ 'hrsh7th/nvim-cmp' }
		},
		opts = {},
		config = function(_, opts)
			local servers = {
				lua_ls = {
					Lua = {
						workspace = {checkThirdParty = false},
						telemetry = {enable = false },
					}
				},
				clangd = {},
				pyright = {},
			}

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

			local on_attach = function(_, bufnr)
				require("keymaps").lspconfig(bufnr)
			end
			require("mason-lspconfig").setup {
				ensure_installed = vim.tbl_keys(servers),
			}
			require("mason-lspconfig").setup_handlers {
				function(server_name)
					require("lspconfig")[server_name].setup {
						capabilities = capabilities,
						on_attach = on_attach,
						settings = servers[server_name],
						filetypes = (servers[server_name] or {}).filetypes,
					}
				end
			}
		end,
	},
}
