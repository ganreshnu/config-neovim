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

			--[[ local efm_package = require("mason-registry").get_package("efm")
			local efm_config = {
				cmd = { "efm-langserver", "-logfile", vim.fn.stdpath("log") .. "/efm.log", "-loglevel", "9" },
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = {},
				init_options = {
					documentFormatting = true,
					documentRangeFormatting = true,
					codeAction = true,
					completion = true,
					publishDiagnostics = true,
					diagnostic = true,
				},
				settings = {
					rootMarkers = { ".git/" },
					languages = {},
				},
			} ]]

			local lspconfigs = require("lspconfig.configs")
			lspconfigs['shfmt'] = {
				default_config = {
					cmd = { "efm-langserver", "-logfile", vim.fn.stdpath("log") .. "/efm-shfmt.log", "-loglevel", "9" },
					filetypes = { "sh", "bash" },
					name = "shfmt",
					init_options = {
						documentFormatting = true,
						documentRangeFormatting = true,
					},
					root_dir = require('lspconfig.util').root_pattern(".git"),
					settings = {
						rootMarkers = { ".git/" },
						languages = {
							["sh"] = require("efmls-configs.formatters.shfmt"),
							["bash"] = require("efmls-configs.formatters.shfmt"),
						},
					},
				},
			}

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

				--[[ if efm_package:is_installed() then
					local tools = {}
					for _, formatter in ipairs(language.formatters) do
						local formatter_settings = require("efmls-configs.formatters." .. formatter)
						table.insert(tools, formatter_settings)
						efm_config.init_options.documentFormatting = true
						-- efm_config.init_options.documentRangeFormatting = true
					end

					for _, linter in ipairs(language.linters) do
						local linter_settings = require("efmls-configs.linters." .. linter)
						table.insert(tools, linter_settings)
						efm_config.init_options.documentFormatting = true
					end

					for _, filetype in ipairs(language.filetypes) do
						if not vim.tbl_isempty(tools) then
							efm_config.settings.languages[filetype] = tools
							table.insert(efm_config.filetypes, filetype)
						end
					end
				end ]]
			end

			--[[ -- configure efm
			if efm_package:is_installed() then
				require("lspconfig").efm.setup(efm_config)
			end ]]
		end,
	},
}
