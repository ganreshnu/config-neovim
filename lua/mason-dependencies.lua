local M = {}

M.dependencies = {
	['clangd'] = { 'unzip' },
	['bash-language-server'] = { 'npm' },
	['json-lsp'] = { 'npm' },
	['awk-language-server'] = { 'npm' },
	['typescript-language-server'] = { 'npm' },
	['pyright'] = { 'npm' },
	['perlnavigator'] = { 'npm' },
	['neocmakelsp'] = { 'cargo' },
	['codelldb'] = { 'unzip' },
	['cpptools'] = { 'unzip' },
	['bash-debug-adapter'] = { 'unzip' },
	['perl-debug-adapter'] = { 'npm' },
	['debugpy'] = { 'python3' },
}

M.can_install = function(name)
	for _, dependency in ipairs(M.dependencies[name] or {}) do
		if vim.fn.executable(dependency) == 0 then
			return false
		end
	end
	return true
end

return M
