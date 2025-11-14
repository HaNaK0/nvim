return {
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = true,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
	},
	{
		"windwp/nvim-ts-autotag",
		opts = {},
	}
}
