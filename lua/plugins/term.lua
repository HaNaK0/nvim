return {
	{
		"akinsho/toggleterm.nvim",
		lazy = true,
		version = "*",
		keys = {
			{ "<c-s>" },
			{ "<leader>g" },
		},
		opts = function()
			local Terminal = require('toggleterm.terminal').Terminal
			local lazygit  = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float"})

			function Lazygit_toggle()
				lazygit:toggle()
			end

			vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua Lazygit_toggle()<CR>", { noremap = true, silent = true })
			return {
				size = 10,
				open_mapping = "<c-s>",
			}
		end
	},
}
