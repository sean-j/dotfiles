-- plugins/lualine.lua
return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin" },
    config = function()
        require("lualine").setup({
            options = {
                theme = "catppuccin-mocha",
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
            },
            sections = {
                lualine_c = { { "filename", path = 1 } },
            },
            extensions = { "nvim-tree", "fugitive" },
        })
    end,
}
