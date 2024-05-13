return {
    "zbirenbaum/copilot.lua",
    dependencies = {
        "zbirenbaum/copilot-cmp",
        "AndreM222/copilot-lualine"
    },
    config = function ()
        -- set up copilot to work with copilot-cmp
        -- (disable ghost text of copilot itself and stuff, so it doesn't 
        -- interfere with the autocomplete)
        require("copilot").setup({
            suggestion = { enabled = false },
            panel = { enabled = false }
        })

        require("copilot_cmp").setup({})
    end
}
