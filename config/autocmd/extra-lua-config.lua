local lintGrp = vim.api.nvim_create_augroup("lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	pattern = "*",
	callback = function()
		require("lint").try_lint()
	end,
	group = lintGrp,
	desc = "run linter",
})
