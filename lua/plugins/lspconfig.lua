-- lspconfig.lua
--
-- nvim-lspconfig plugin.

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Useful status updates for LSP
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ "j-hui/fidget.nvim", tag = "legacy", opts = {} },
			-- Additional lua configuration, makes nvim stuff amazing!
			{ "folke/neodev.nvim", opts = {} },
			"hrsh7th/nvim-cmp",
			"creativenull/efmls-configs-nvim",
		},
		config = function()
			-- vim.lsp.set_log_level("TRACE")
			-- setup the client capabilities
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			-- run when the buffer is attached
			local on_attach = function(_, bufnr)
				vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
				require("keymaps").lspconfig(bufnr)
			end

			local efm_package = require("mason-registry").get_package('efm')
			if efm_package:is_installed() then

				local lspconfigs = require("lspconfig.configs")
				lspconfigs['shfmt'] = {
					default_config = {
						cmd = { "efm-langserver", "-logfile", vim.fn.stdpath("log") .. "/efm-shfmt.log", "-loglevel", "1" },
						root_dir = require('lspconfig.util').find_git_ancestor,
						single_file_support = true,

						filetypes = { "sh", "bash" },
						init_options = {
							documentFormatting = true,
							documentRangeFormatting = true,
						},
						settings = {
							-- rootMarkers = { ".git/" },
							languages = {
								["sh"] = { require("efmls-configs.formatters.shfmt") },
								["bash"] = { require("efmls-configs.formatters.shfmt") },
							},
						},
					},
				}

			end

			--[[ lspconfigs['shellcheck'] = {
				default_config = {
					cmd = { "efm-langserver", "-logfile", vim.fn.stdpath("log") .. "/efm-shellcheck.log", "-loglevel", "9" },
					filetypes = { "sh", "bash" },
					init_options = {
						codeAction = true,
						publishDiagnostics = true,
						diagnostic = true,
					},
					root_dir = require('lspconfig.util').find_git_ancestor,
					single_file_support = true,
					settings = {
						rootMarkers = { ".git/" },
						languages = {
							["sh"] = { require("efmls-configs.linters.shellcheck") },
							["bash"] = { require("efmls-configs.linters.shellcheck") },
						},
					},
				},
			} ]]

			for _, language in ipairs(languages) do
				for servername, config in pairs(language.lsp_servers) do
					config = vim.is_callable(config) and config() or config
					-- get the lspconfig name
					local name = config[1] or servername
					table.remove(config, 1)

					-- check if server is installed
					local package = require("mason-registry").get_package(servername)
					if package:is_installed() then
						config.capabilities = capabilities
						config.filetypes = language.filetypes
						config.on_attach = on_attach
						require('lspconfig')[name].setup(config)
					end
				end
			end
		end,
	},
}
