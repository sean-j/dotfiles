-- plugins/telescope.lua
return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
        { "<Leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
        { "<Leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
        { "<Leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
        { "<Leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help tags" },
        { "<Leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Recent files" },
        { "<Leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", desc = "Document symbols" },
        { "<Leader>fw", "<cmd>Telescope lsp_workspace_symbols<CR>", desc = "Workspace symbols" },
        { "<Leader>fd", "<cmd>Telescope diagnostics<CR>", desc = "Diagnostics" },
        { "<C-p>", "<cmd>Telescope find_files<CR>", desc = "Find files" },
        { "<C-w><Space>", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        local telescope = require("telescope")
        telescope.setup({
            defaults = {
                file_ignore_patterns = { "node_modules", ".git/" },
            },
            pickers = {
                find_files = { hidden = true },
            },
        })
        telescope.load_extension("fzf")
    end,
}
