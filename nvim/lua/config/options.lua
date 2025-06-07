local opt = vim.opt

-- Indent
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = false
opt.smartindent = true
opt.wrap = false

-- Appearance
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.termguicolors = true
opt.showmode = true
opt.colorcolumn = "100"
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.scrolloff = 10
opt.completeopt = "menuone,noinsert,noselect"
opt.conceallevel = 3

-- Search
opt.incsearch = true
opt.hlsearch = false
opt.ignorecase = true
opt.smartcase = true

-- Behaviuor
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.modifiable = true
opt.encoding = "UTF-8"
