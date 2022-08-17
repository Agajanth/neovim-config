-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use({
    "themercorp/themer.lua",
    config = function()
    require("themer").setup({
        colorscheme = "dracula",
        styles = {
            ["function"] = { style = 'italic' },
             functionbuiltin = { style = 'italic' },
             variable = { style = 'italic' },
              variableBuiltIn = { style = 'italic' },
            parameter  = { style = 'italic' },
        },
    })
    end
})
  -- General
  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }
  use 'mileszs/ack.vim'
  use 'simeji/winresizer'
  use 'haya14busa/incsearch.vim'
  use {
      'phaazon/hop.nvim',
      branch = 'v1'
    }
  use 'ThePrimeagen/harpoon'
  use 'tpope/vim-surround'

  -- Git
  use 'cohama/agit.vim'
  use 'airblade/vim-gitgutter'
  use 'tpope/vim-fugitive'

  -- UI
  use 'Yggdroot/indentLine'
  use 'nvim-lualine/lualine.nvim'
  use 'ryanoasis/vim-devicons'
  use 'scrooloose/NERDTree'

  -- Languages
  use 'fatih/vim-go'
  use 'elzr/vim-json'
  use 'neoclide/vim-jsx-improve'
  use 'vim-test/vim-test'
  use 'voldikss/vim-floaterm'

  -- Gist vim
  use 'mattn/vim-gist'
  use 'mattn/webapi-vim'

  -- Telescope
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make'
  }
  use "ahmedkhalf/project.nvim"

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    opt = true,
    event = "BufReadPost",
    wants = { "nvim-lsp-installer" },
    config = function()
      require("config.lsp").setup()
    end,
    requires = {
      "williamboman/nvim-lsp-installer",
    },
  }
  use 'akinsho/nvim-bufferline.lua' --bufferline

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'neovim/nvim-lspconfig' -- LSP
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  use 'glepnir/lspsaga.nvim' -- LSP UIs
  use 'L3MON4D3/LuaSnip'

  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  use 'folke/which-key.nvim'
  use  'kyazdani42/nvim-web-devicons' --file icons
  --use {
  --    'folke/trouble.nvim',
  --    requires = { 'kyazdani42/nvim-web-devicons' },
  --}
end)
