-- plugins/lsp.lua
return {
    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall" },
        config = true,
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "williamboman/mason.nvim", "hrsh7th/cmp-nvim-lsp" },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(ev)
                    local map = function(keys, func, desc)
                        vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = desc })
                    end
                    map("gD", vim.lsp.buf.declaration, "Go to declaration")
                    map("gd", vim.lsp.buf.definition, "Go to definition")
                    map("K", vim.lsp.buf.hover, "Hover")
                    map("gi", vim.lsp.buf.implementation, "Go to implementation")
                    map("<C-s>", vim.lsp.buf.signature_help, "Signature help")
                    map("<Leader>rn", vim.lsp.buf.rename, "Rename")
                    map("<Leader>ca", vim.lsp.buf.code_action, "Code action")
                    map("gr", vim.lsp.buf.references, "References")
                    map("<Leader>e", vim.diagnostic.open_float, "Show diagnostic")
                    map("[d", function() vim.diagnostic.jump({ count = -1 }) end, "Prev diagnostic")
                    map("]d", function() vim.diagnostic.jump({ count = 1 }) end, "Next diagnostic")
                end,
            })

            local servers = { "pyright", "ts_ls", "kotlin_language_server", "sourcekit", "sqls" }
            for _, server in ipairs(servers) do
                vim.lsp.config(server, { capabilities = capabilities })
            end

            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        workspace = { checkThirdParty = false },
                    },
                },
            })

            vim.lsp.enable(vim.list_extend(servers, { "lua_ls" }))
        end,
    },
}
