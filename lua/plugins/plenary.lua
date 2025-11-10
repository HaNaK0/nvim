return {
	"nvim-lua/plenary.nvim",
	cmd = { "Love" },
	config = function()
		local job = require('plenary.job')

		function Run_love()
			---@diagnostic disable-next-line: missing-fields
			job:new({
				command = "love",
				args = { "./" },
				on_stderr = function(err)
					if err then
						print(err)
					end
				end
			}):start()
		end

		vim.api.nvim_create_user_command("Love", Run_love, {})
	end
}
