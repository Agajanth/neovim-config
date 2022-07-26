require('options')

require('plugin_flags')
require('plugins')
require('config.set_up')
require('config.lsp')

vim.cmd("syntax on")
-- vim.cmd('colorscheme tokyonight')
vim.cmd('colorscheme themer_dracula')
require('config.lsp.keymaps')
