return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			{ "ms-jpq/coq_nvim",       branch = "coq" },
			{ "ms-jpq/coq.artifacts",  branch = "artifacts" },
			{ 'ms-jpq/coq.thirdparty', branch = "3p" }
		},
		init = function()
			vim.g.coq_settings = {
				auto_start = true, -- if you want to start COQ at startup
				-- Your COQ settings here
			}
		end,
		config = function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()

			require('mason').setup()
			local mason_lspconfig = require 'mason-lspconfig'
			mason_lspconfig.setup {
				ensure_installed = { "pyright", "ts_ls", "marksman"}
			}
			require("lspconfig").pyright.setup {
				capabilities = capabilities,
			}
			require("lspconfig").lua_ls.setup {}

			require("lspconfig").ts_ls.setup {}

			require("lspconfig").marksman.setup {}
			vim.keymap.set("n", "gl", vim.diagnostic.open_float)
		end
	},
}
