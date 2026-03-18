-- plugins/treesitter.lua
return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        ensure_installed = {
            "python", "typescript", "javascript", "tsx",
            "kotlin", "swift", "sql",
            "lua", "vim", "vimdoc",
            "json", "yaml", "toml", "html", "css",
            "bash", "markdown", "markdown_inline",
            "gitcommit", "diff",
        },
        highlight = { enable = true },
        indent = { enable = true },
    },
}
