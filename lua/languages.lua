--
-- returns an array of Language objects
--
return {
	{
		"Lua",
		filetypes = { "lua" },
		lsp_servers = {
			{
				"lua-language-server",
				root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
				settings = {
					Lua = {
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
						},
						runtime = {
							version = 'LuaJIT'
						}
					}
				}
			},
		},
		debug_adapters = {
			{
				"local-lua-debugger-vscode",
				type = 'executable',
				command = 'node',
				args = { 'local-lua-debugger-vscode/extension/debugAdapter.js' },
			},
		},
		-- the 'lua' grammar is installed by neovim
		grammars = { "luadoc" },
	},
	{
		"Shell Script",
		filetypes = { "sh", "bash" },
		lsp_servers = {
			{
				"bash-language-server",
				cmd = { 'bash-language-server', 'start' },
				settings = {
					bashIde = {
						-- Glob pattern for finding and parsing shell script files in the workspace.
						-- Used by the background analysis features across files.

						-- Prevent recursive scanning which will cause issues when opening a file
						-- directly in the home directory (e.g. ~/foo.sh).
						--
						-- Default upstream pattern is "**/*@(.sh|.inc|.bash|.command)".
						globPattern = vim.env.GLOB_PATTERN or '*@(.sh|.inc|.bash|.command)',
					},
				},
			},
		},
		debug_adapters = {
			{
				"bash-debug-adapter",
				type = "executable",
				command = "bash-debug-adapter",
				-- args = { "start" },
			},
		},
		grammars = { 'bash' }
	},
	{
		"JSON",
		filetypes = { "json", "jsonc" },
		lsp_servers = {
			{
				"json-lsp",
				cmd = { "vscode-json-language-server", '--stdio' },
				settings = {},
			},
		},
		grammars = { 'json' }
	},
	{
		"CMake",
		filetypes = { "cmake" },
		lsp_servers = {
			{
				"neocmakelsp",
				cmd = { "neocmakelsp", "stdio" },
			},
		},
		grammars = { 'cmake' }
	},
	{
		"C and C++",
		filetypes = { "c", "cpp" },
		lsp_servers = {
			{
				"clangd",
				cmd = { "clangd", "--background-index" },
				root_markers = { 'compile_commands.json' },
			},
		},
		debug_adapters = {
			{
				id = 'gdb',
				type = 'executable',
				command = 'gdb',
				args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
			},
		},
		-- the 'c' grammar is installed by neovim
		grammars = { 'cpp' }
	},
	{
		"Python",
		filetypes = { "python" },
		lsp_servers = {
			{
				"basedpyright",
				cmd = { 'basedpyright-langserver', '--stdio' },
				root_markers = {
					'pyproject.toml',
					'pyrightconfig.json',
					'setup.py',
					'setup.cfg',
					'requirements.txt',
					'Pipfile',
					'.git',
				},
				settings = {},
			},
		},
		grammars = { 'python' },
	},
	{
		"TOML",
		filetypes = { "toml" },
		lsp_servers = {
			{
				'tombi',
				cmd = { 'tombi', 'lsp' },
				root_markers = { 'tombi.toml', 'pyproject.toml', '.git' },
			},
		},
		grammars = { 'toml' }
	},
	{
		"Markdown",
		filetypes = { 'markdown', 'markdown.mdx' },
		lsp_servers = {
			{
				'marksman',
				cmd = { "marksman", "server" },
				root_markers = { '.marksman.toml', '.git' },
			},
		},
		-- the grammar 'markdown' is installed by neovim
	},
	{
		"Docker",
		filetypes = { 'dockerfile' },
		lsp_servers = {
			{
				'dockerfile-language-server',
				cmd = { 'docker-langserver', '--stdio' },
				root_markers = { '.git' },
			},
		},
		grammars = { 'dockerfile' }
	},
	{
		"Rust",
		filetypes = { 'rust' },
		lsp_servers = {
			{
				'rust-analyzer',
				cmd = { 'rust-analyzer' },
				root_markers = { 'Cargo.toml', '.git' },
			}
		},
		grammars = { 'rust' }
	},
}
