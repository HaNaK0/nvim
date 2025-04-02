return {
	{
		"folke/lazydev.nvim",
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library",    words = { "vim%.uv" } },
				{ path = "${3rd}/love2d/library", words = { "love" } }
			},
			integrations = {
				lspconfig = true,
				cmp = false,
				coq = true,
			},
			enabled = function(root_dir)
				return not vim.uv.fs_stat(root_dir .. "/.luarc.json")
			end,
			filetypes = { "lua", "scene" },
		},
	},
	-- { "folke/neodev.nvim", enabled = false }, -- make sure to uninstall or disable neodev.nvim
}
