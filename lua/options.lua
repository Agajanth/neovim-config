local set = vim.opt

set.expandtab = true
set.smartindent = true
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 2
set.relativenumber = true
set.nu = true
set.errorbells = false
set.wrap = false --keeps longer lines hidden when they exceed the visible area
set.ignorecase = true
set.swapfile = false
set.backup = false
set.undodir = os.getenv( "HOME" ) .. "/.vim/undodir"
set.undofile = true
set.undolevels = 1000
set.undoreload = 10000
set.incsearch = true
set.termguicolors = true
set.scrolloff = 8
set.completeopt = {'menuone', 'noinsert', 'noselect'}
set.signcolumn = 'yes'
set.mouse = 'a'
set.clipboard = 'unnamedplus'
set.ttyfast = true
set.encoding = 'utf-8'
set.hidden = true
set.writebackup = false
set.updatetime = 1000 -- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
set.cursorline = true
set.shortmess = set.shortmess + 'c'

-- Folding
set.foldmethod = 'indent'
set.foldnestmax = 10
set.foldenable = false
set.foldlevel = 2

-- Set tokyonight background
vim.g.tokyonight_style = "night"
