return {
    "nvim-telescope/telescope.nvim", tag = "0.1.6",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Files" },
        { "<leader>fgf", "<cmd>Telescope git_files show_untracked=true<CR>", desc = "Files" },
        { "<leader>fgc", "<cmd>Telescope git_commits<CR>", desc = "Commits" },
        { "<leader>fgb", "<cmd>Telescope git_branches<CR>", desc = "Branches" },
        { "<leader>fgs", "<cmd>Telescope git_status<CR>", desc = "Status" },
        { "<leader>fgS", "<cmd>Telescope git_stash<CR>", desc = "Stash" },
        { "<leader>fr", "<cmd>Telescope oldfiles only_cwd=true<CR>", desc = "Recently Opened Files" },
        { "<leader>fl", "<cmd>Telescope live_grep theme=dropdown<CR>", desc = "Live Grep" },
    }
}
