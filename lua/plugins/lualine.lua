return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		globalstatus = true,
		icons_enabled = true,
		theme = "gruvbox",
		disabled_filetypes = { "alpha", "dashboard" },
		always_divide_middle = true,
	},
	config = function()
		local ll = require("lualine")

		local diagnostics = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
    			symbols = { error = " ", warn = " " },
    			colored = true,
    			always_visible = true,
		}

		local diff = {
		    "diff",
		    colored = true,
		    symbols = { added = " ", modified = " ", removed = " " },
		}

		local filetype = {
		    "filetype",
		    icons_enabled = true,
		}

		local location = {
		    "location",
		    padding = 1,
		}

		local setup = {
		    sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch" },
			lualine_c = { diagnostics },
			lualine_x = { diff, "encoding", filetype },
			lualine_y = { location },
			lualine_z = { "progress" },
		    },
		}

		-- finally call the setup with all the things we configured above
		ll.setup(setup)
	end
}
