local lintGrp = vim.api.nvim_create_augroup("lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	pattern = "*",
	callback = function()
		require("lint").try_lint()
	end,
	group = lintGrp,
	desc = "run linter",
})

local fileTypeGroup = vim.api.nvim_create_augroup("custom_filetype", { clear = true })

-- Create the autocommand.
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "*.slint",
	group = fileTypeGroup,
	callback = function()
		vim.opt.filetype = "slint"
	end,
})

vim.cmd([[ autocmd BufRead,BufNewFile *.slint set filetype=slint ]])
