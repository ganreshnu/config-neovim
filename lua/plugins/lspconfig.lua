-- lspconfig.lua
--
-- nvim-lspconfig plugin.

local function find_lang_for_lsp_server(server_name)
	for _, lang in ipairs(vim.g.languages) do
		if lang.lsp_servers[server_name] ~= nil then
			return lang
		end
	end
	return nil
end

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
					local lang = find_lang_for_lsp_server(server_name) or {}
					require("lspconfig")[server_name].setup {
						capabilities = capabilities,
						on_attach = on_attach,
						settings = lang.lsp_servers[server_name],
						filetypes = lang.filetypes,
					}
				end
			}
		end,
	},
}
