require('options')

require('plugin_flags')
require('plugins')
require('config.set_up')
require('config.lsp')

vim.cmd("syntax on")
vim.cmd('colorscheme tokyonight')

require('config.lsp.keymaps')
