local mason_lspconfig = {
	{	
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			automatic_installation = true,
		}
	}
}
return {
    {
	"neovim/nvim-lspconfig",
	ft = "lua",
	dependencies = mason_lspconfig,
	config = function() 
		require("mason")
		require("mason-lspconfig")

		require("lspconfig").lua_ls.setup {}
	end
    }
}
