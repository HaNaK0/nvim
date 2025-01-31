return {
	{
		"catppuccin/nvim",
		lazy = false,
		priority=1000,
		config = function()
			-- load the colorscheme here
      			vim.cmd([[colorscheme catppuccin]])
    		end,
	},
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{
		'nvim-lualine/lualine.nvim',
    		dependencies = { 'nvim-tree/nvim-web-devicons' },
		lazy = false,
		opts = {},
	},
}
