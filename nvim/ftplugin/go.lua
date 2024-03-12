vim.cmd.packadd("go.nvim")

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		require("go.format").goimport()
	end,
	group = vim.api.nvim_create_augroup("GoFormat", {}),
})

require("go").setup()
