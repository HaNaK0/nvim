require("config.lazy")

vim.o.linebreak = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = false
vim.o.exrc = true

local love_file = vim.fn.findfile("build_love.sh", ".", 1)
if love_file ~= "" then
	--vim.api.nvim_create_autocmd("BufWritePost", { pattern = "*.lua", command = ":!bash " .. love_file })
	vim.api.nvim_create_user_command("B", ":!bash " .. love_file , {})
	print("registered love build autocmd")
end

vim.keymap.set("n", "<leader>d", function()
	vim.diagnostic.open_float()
end)

vim.keymap.set("n", "<leader>r", function()
	-- when rename opens the prompt, this autocommand will trigger
	-- it will "press" CTRL-F to enter the command-line window `:h cmdwin`
	-- in this window I can use normal mode keybindings
	local cmdId
	cmdId = vim.api.nvim_create_autocmd({ "CmdlineEnter" }, {
		callback = function()
			local key = vim.api.nvim_replace_termcodes("<C-f>", true, false, true)
			vim.api.nvim_feedkeys(key, "c", false)
			vim.api.nvim_feedkeys("0", "n", false)
			-- autocmd was triggered and so we can remove the ID and return true to delete the autocmd
			cmdId = nil
			return true
		end,
	})
	vim.lsp.buf.rename()
	-- if LPS couldn't trigger rename on the symbol, clear the autocmd
	vim.defer_fn(function()
		-- the cmdId is not nil only if the LSP failed to rename
		if cmdId then
			vim.api.nvim_del_autocmd(cmdId)
		end
	end, 500)
end)

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
