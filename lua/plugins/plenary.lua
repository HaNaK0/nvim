return {
	"nvim-lua/plenary.nvim",
	cmd = { "Love" },
	config = function()
		local job = require('plenary.job')

		local function run_love()
			---@diagnostic disable-next-line: missing-fields
			job:new({
				command = "love",
				args = { "./" },
				on_stderr = function(err)
					print(err)
				end
			}):start()
		end

		vim.api.nvim_create_user_command("Love", run_love, {})
	end
}
