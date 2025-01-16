local highlight = vim.api.nvim_set_hl

-- return object
local M = {}
M.style = function()

	-- highlight(0, "Normal", { ctermfg = red, bold = true })
	-- highlight(0, "LineNr", { bg = 'green', ctermbg = 'red' })
	-- highlight(0, "Comment", { ctermfg = 'red', italic = true })
end

return M
