-- plugins/nvim-tree.lua
return {
    "nvim-tree/nvim-tree.lua",
    keys = {
        { "<Leader>t.", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file tree" },
    },
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("nvim-tree").setup({
            view = { width = 30 },
            filters = { dotfiles = false },
            git = { enable = true },
        })
    end,
}
