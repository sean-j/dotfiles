-- plugins/git.lua
return {
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("gitsigns").setup({
                signs = {
                    add = { text = "+" },
                    change = { text = "~" },
                    delete = { text = "_" },
                    topdelete = { text = "-" },
                    changedelete = { text = "~" },
                },
            })
        end,
    },
    {
        "tpope/vim-fugitive",
        cmd = { "Git", "Gdiffsplit", "Gread", "Gwrite", "GBrowse" },
        keys = {
            { "<Leader>gs", "<cmd>Git<CR>", desc = "Git status" },
            { "<Leader>gb", "<cmd>Git blame<CR>", desc = "Git blame" },
        },
    },
    {
        "tpope/vim-rhubarb",
        dependencies = { "tpope/vim-fugitive" },
        cmd = { "GBrowse" },
    },
}
