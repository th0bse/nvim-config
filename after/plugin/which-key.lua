local wk = require("which-key")

local global_opts_leader = {
    mode = "n",   -- normal mode
    prefix = "<leader>",
    buffer = nil, -- global mappings
    silent = true,
    noremap = true,
    nowait = true,
}

local global_mappings_prefix_docs = {
    F = { name = "File Tree" },
    f = { name = "Find",
        g = { name = "Git Repository" },
    },
}

wk.register(global_mappings_prefix_docs, global_opts_leader)
