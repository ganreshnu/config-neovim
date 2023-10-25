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
