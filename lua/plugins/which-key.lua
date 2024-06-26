return {
	"folke/which-key.nvim",
    lazy = true,
    opts = {
        plugins = {
            marks = true,       -- shows a list of all marks on
            registers = true,   -- shows a list of all registers on " in n mode
            spelling = {
                enabled = false,
            },
            presets = {
                operators = true,
                motions = true,
                text_objects = true,
                windows = true,
                nav = true,
                z = true,
                g = true,
            },
        },

        popup_mappings = {
            scroll_down = "<c-d>",
            scroll_up = "<c-u>",
        },

        window = {
            border = "single",
            position = "bottom",
            margin = { 1, 0, 1, 0 },
            padding = { 1, 2, 1, 2 },
            winblend = 0,
            zindex = 1000,
        },

        layout = {
            height = { min = 4, max = 25 },
            width = {min = 20, max = 50 },
            spacing = 3,
            align = "center"
        },

        hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " }, -- hide mapping boilerplate

        show_help = true,

        show_keys = true,

        triggers = { "<leader>", "<c>", "<C>", '"', "'" },

        disable = {
            buftypes = {},
            filetypes = {},
        },

    },
}
