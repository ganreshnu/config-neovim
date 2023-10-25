-- lspconfig.lua
--
-- nvim-lspconfig plugin.

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
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
				vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
				require("keymaps").lspconfig(bufnr)
			end

			local dependencies = {
				['clangd'] = { 'unzip' },
				['bash-language-server'] = { 'npm' },
				['json-lsp'] = { 'npm' },
				['awk-language-server'] = { 'npm' },
				['typescript-language-server'] = { 'npm' },
				['pyright'] = { 'npm' },
				['perlnavigator'] = { 'npm' },
				['neomakelsp'] = { 'cargo' },
			}
			local can_install = function(name)
				if not dependencies[name] then return true end
				for _, dependency in ipairs(dependencies[name]) do
					if vim.fn.executable(dependency) == 0 then
						return false
					end
				end
				return true
			end

			local installing = false
			for _, language in ipairs(languages) do
				for servername, config in pairs(language.lsp_servers) do
					-- get the lspconfig name
					local name = config[1] or servername
					table.remove(config, 1)

					-- check if server is installed
					local package = require('mason-registry').get_package(servername)
					if package:is_installed() then
						config.on_attach = on_attach
						require('lspconfig')[name].setup(config)
					elseif can_install(servername) then
						package:install()
						installing = true
					end
				end
			end

			if installing then
				print("installing lsp servers. restart after")
			end
		end,
	},
}
