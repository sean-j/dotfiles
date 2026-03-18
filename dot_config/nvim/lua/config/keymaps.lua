-- config/keymaps.lua
local map = vim.keymap.set

vim.g.mapleader = ","

-- Edit/source config
map("n", "<Leader><C-o>", ":edit $HOME/.config/nvim/init.lua<CR>")

-- Yank to system clipboard
map("n", "<Leader>y", '"+y')
map("v", "<Leader>y", '"+y')

-- Toggle folding
map("n", "<Space>", "@=(foldlevel('.')?'za':'\\<Space>')<CR>", { silent = true })

-- Scroll
map("", "<C-j>", "<C-d>")
map("", "<C-k>", "<C-u>")

-- Treat wrapped lines as normal lines
map("n", "j", "gj")
map("n", "k", "gk")

-- Disable F1 and ex mode
map({ "i", "n", "v" }, "<F1>", "<Nop>")
map("", "Q", "<Nop>")

-- Buffer navigation
map("n", "gn", ":bnext<CR>")
map("n", "gp", ":bprevious<CR>")
map("n", "gd", ":bdelete<CR>")

-- Highlight last inserted text
map("n", "gV", "'[V']")

-- Clear search highlight
map("n", "<CR>", ":let @/ = ''<CR>", { silent = true })

-- Toggle options
map("n", "th", ":setlocal hlsearch!<CR>:setlocal hlsearch?<CR>")
map("n", "<Leader>tn", ":setlocal number!<CR>:setlocal number?<CR>")
map("n", "<Leader>trn", ":setlocal relativenumber!<CR>:setlocal relativenumber?<CR>")
map("n", "<Leader>tw", ":set wrap!<CR>:set wrap?<CR>")

-- Strip trailing whitespace
map("n", "<Leader><Space>d", function()
    local pos = vim.api.nvim_win_get_cursor(0)
    vim.cmd([[%s/\s\+$//e]])
    vim.api.nvim_win_set_cursor(0, pos)
end)

-- Write with sudo
vim.api.nvim_create_user_command("SudoWrite", function()
    vim.cmd("silent w !sudo tee '%' > /dev/null")
    vim.cmd("edit!")
end, {})
vim.api.nvim_create_user_command("W", "write", {})

-- Fugitive diff
map("n", "<Leader>dgh", ":diffget //2<CR>")
map("n", "<Leader>dgl", ":diffget //3<CR>")
