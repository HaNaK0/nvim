require("config.lazy")

vim.o.linebreak = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = false

local love_file = vim.fn.findfile("build_love.sh", ".", 1)
if love_file ~= "" then
	vim.api.nvim_create_autocmd("BufWritePost", {pattern = "*.lua", command = ":!bash " .. love_file})
	print("registered love build autocmd")
end

vim.keymap.set("n", "<leader>d", function ()
	vim.diagnostic.open_float()
end)
