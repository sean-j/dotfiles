-- config/options.lua
local opt = vim.opt

-- UI
opt.number = true
opt.numberwidth = 5
opt.cursorline = true
opt.scrolloff = 3
opt.showcmd = true
opt.title = true
opt.termguicolors = true
opt.signcolumn = "yes"
opt.showmode = false
opt.splitbelow = false
opt.splitright = false
opt.laststatus = 2

-- Encoding
opt.fileencodings = { "ucs-bom", "utf-8", "cp949", "euc-kr", "latin1" }

-- Search
opt.incsearch = true
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true
if vim.fn.executable("rg") == 1 then
    opt.grepprg = "rg --vimgrep"
end

-- Matching
opt.showmatch = true
opt.matchtime = 2
opt.matchpairs:append("<:>")

-- Tabs & Indentation
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.smarttab = true
opt.shiftround = true
opt.autoindent = true

-- Text
opt.wrap = false
opt.linebreak = true
opt.list = true
opt.listchars = { tab = ">\\ " }
opt.formatoptions:append("j")
opt.nrformats:append("alpha")

-- Folding
opt.foldmethod = "indent"
opt.foldnestmax = 10
opt.foldlevelstart = 99
opt.foldcolumn = "0"

-- Files
opt.autoread = true
opt.confirm = true
opt.backup = false
opt.swapfile = true
opt.undofile = true
opt.undolevels = 500
opt.undoreload = 10000
opt.updatecount = 50

-- Completion
opt.completeopt = { "menu", "preview", "longest" }
opt.wildignore:append("*.bak,*.swp,*.swo,*.a,*.o,*.so,*.pyc,*.class")
opt.wildignore:append("*.jpg,*.jpeg,*.gif,*.png,*.pdf,*/.git*,*.tar,*.zip")
opt.wildmenu = true
opt.wildmode = "longest:full,list:full"

-- Misc
opt.hidden = true
opt.history = 1000
opt.iskeyword:append("_")
opt.mouse = "a"
opt.shortmess:append("I")
opt.startofline = false
opt.clipboard = "unnamedplus"
opt.ttyfast = true
opt.visualbell = true

-- disable netrw (using nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
