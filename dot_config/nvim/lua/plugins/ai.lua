-- plugins/ai.lua
return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    keymap = {
                        accept = "<M-l>",
                        accept_word = "<M-w>",
                        next = "<M-]>",
                        prev = "<M-[>",
                        dismiss = "<C-]>",
                    },
                },
                panel = { enabled = false },
            })
        end,
    },
    {
        "Exafunction/codeium.nvim",
        cmd = "Codeium",
        event = "InsertEnter",
        dependencies = { "nvim-lua/plenary.nvim", "hrsh7th/nvim-cmp" },
        config = function()
            require("codeium").setup({})
        end,
    },
}
