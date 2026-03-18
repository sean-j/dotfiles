-- plugins/editor.lua
return {
    -- Surround
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        config = true,
    },
    -- Undotree
    {
        "mbbill/undotree",
        keys = {
            { "<Leader>tU", "<cmd>UndotreeToggle<CR>", desc = "Toggle undotree" },
        },
    },
    -- Which-key (shows pending keybinds)
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = true,
    },
    -- Auto pairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },
    -- Comment toggle
    {
        "numToStr/Comment.nvim",
        keys = {
            { "gcc", mode = "n", desc = "Comment line" },
            { "gc", mode = "v", desc = "Comment selection" },
        },
        config = true,
    },
    -- Indent guides
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("ibl").setup({
                indent = { char = "|" },
                scope = { enabled = false },
            })
        end,
    },
}
