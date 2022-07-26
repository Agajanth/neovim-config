if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
    vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
    return
  end
  
  im.api.nvim_command('packadd packer.nvim')

  local no_errors, error_msg = pcall(function()
  
    local time
    local profile_info
    local should_profile = false
    if should_profile then
      local hrtime = vim.loop.hrtime
      profile_info = {}
      time = function(chunk, start)
        if start then
          profile_info[chunk] = hrtime()
        else
          profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
        end
      end
    else
      time = function(chunk, start) end
    end
    
  local function save_profiles(threshold)
    local sorted_times = {}
    for chunk_name, time_taken in pairs(profile_info) do
      sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
    end
    table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
    local results = {}
    for i, elem in ipairs(sorted_times) do
      if not threshold or threshold and elem[2] > threshold then
        results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
      end
    end
  
    _G._packer = _G._packer or {}
    _G._packer.profile_output = results
  end
  
  time([[Luarocks path setup]], true)
  local package_path_str = "/Users/disaza/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/disaza/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/disaza/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/disaza/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
  local install_cpath_pattern = "/Users/disaza/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
  if not string.find(package.path, package_path_str, 1, true) then
    package.path = package.path .. ';' .. package_path_str
  end
  
  if not string.find(package.cpath, install_cpath_pattern, 1, true) then
    package.cpath = package.cpath .. ';' .. install_cpath_pattern
  end
  
  time([[Luarocks path setup]], false)
  time([[try_loadstring definition]], true)
  local function try_loadstring(s, component, name)
    local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
    if not success then
      vim.schedule(function()
        vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
      end)
    end
    return result
  end
  
  time([[try_loadstring definition]], false)
  time([[Defining packer_plugins]], true)
  _G.packer_plugins = {
    ["Comment.nvim"] = {
      config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
      loaded = true,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/start/Comment.nvim",
      url = "https://github.com/numToStr/Comment.nvim"
    },
    LuaSnip = {
      config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19config.luasnip\frequire\0" },
      load_after = {
        ["nvim-cmp"] = true
      },
      loaded = false,
      needs_bufread = true,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/opt/LuaSnip",
      url = "https://github.com/L3MON4D3/LuaSnip",
      wants = { "friendly-snippets" }
    },
    NERDTree = {
      loaded = true,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/start/NERDTree",
      url = "https://github.com/scrooloose/NERDTree"
    },
    ["ack.vim"] = {
      loaded = true,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/start/ack.vim",
      url = "https://github.com/mileszs/ack.vim"
    },
    ["agit.vim"] = {
      loaded = true,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/start/agit.vim",
      url = "https://github.com/cohama/agit.vim"
    },
    ["auto-pairs"] = {
      loaded = true,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/start/auto-pairs",
      url = "https://github.com/jiangmiao/auto-pairs"
    },
    ["cmp-buffer"] = {
      after_files = { "/Users/disaza/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
      load_after = {
        ["nvim-cmp"] = true
      },
      loaded = true,
      needs_bufread = true,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
      url = "https://github.com/hrsh7th/cmp-buffer"
    },
    ["cmp-nvim-lsp"] = {
      after_files = { "/Users/disaza/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
      load_after = {
        ["nvim-cmp"] = true
      },
      loaded = true,
      needs_bufread = far lse,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp",
      url = "https://github.com/hrsh7th/cmp-nvim-lsp"
    },
    ["cmp-nvim-lua"] = {
      after_files = { "/Users/disaza/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
      load_after = {
        ["nvim-cmp"] = true
      },
      loaded = false,
      needs_bufread = false,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua",
      url = "https://github.com/hrsh7th/cmp-nvim-lua"
    },
    ["cmp-path"] = {
      after_files = { "/Users/disaza/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
      load_after = {
        ["nvim-cmp"] = true
      },
      loaded = false,
      needs_bufread = false,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/opt/cmp-path",
      url = "https://github.com/hrsh7th/cmp-path"
    },
    ["cmp-treesitter"] = {
      after_files = { "/Users/disaza/.local/share/nvim/site/pack/packer/opt/cmp-treesitter/after/plugin/cmp_treesitter.lua" },
      load_after = {
        ["nvim-cmp"] = true
      },
      loaded = false,
      needs_bufread = false,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/opt/cmp-treesitter",
      url = "https://github.com/ray-x/cmp-treesitter"
    },
    cmp_luasnip = {
      after_files = { "/Users/disaza/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
      load_after = {
        ["nvim-cmp"] = true
      },
      loaded = false,
      needs_bufread = false,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/opt/cmp_luasnip",
      url = "https://github.com/saadparwaiz1/cmp_luasnip"
    },
    ["friendly-snippets"] = {
      load_after = {
        ["nvim-cmp"] = true
      },
      loaded = false,
      needs_bufread = false,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/opt/friendly-snippets",
      url = "https://github.com/rafamadriz/friendly-snippets"
    },
    harpoon = {
      loaded = true,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/start/harpoon",
      url = "https://github.com/ThePrimeagen/harpoon"
    },
    ["hop.nvim"] = {
      loaded = true,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/start/hop.nvim",
      url = "https://github.com/phaazon/hop.nvim"
    },
    ["incsearch.vim"] = {
      loaded = true,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/start/incsearch.vim",
      url = "https://github.com/haya14busa/incsearch.vim"
    },
    indentLine = {
      loaded = true,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/start/indentLine",
      url = "https://github.com/Yggdroot/indentLine"
    },
    ["lspsaga.nvim"] = {
      loaded = true,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
      url = "https://github.com/tami5/lspsaga.nvim"
    },
    ["lualine.nvim"] = {
      loaded = true,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/start/lualine.nvim",
      url = "https://github.com/nvim-lualine/lualine.nvim"
    },
    ["nvim-cmp"] = {
      after = { "cmp-nvim-lsp", "cmp-treesitter", "LuaSnip", "cmp_luasnip", "friendly-snippets", "cmp-path", "cmp-nvim-lua", "cmp-buffer" },
      config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15config.cmp\frequire\0" },
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
      url = "https://github.com/hrsh7th/nvim-cmp",
      wants = { "LuaSnip" }
    },
    ["nvim-lsp-installer"] = {
      load_after = {
        ["nvim-lspconfig"] = true
      },
      loaded = false,
      needs_bufread = true,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/opt/nvim-lsp-installer",
      url = "https://github.com/williamboman/nvim-lsp-installer"
    },
    ["nvim-lspconfig"] = {
      after = { "nvim-lsp-installer" },
      config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15config.lsp\frequire\0" },
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
      url = "https://github.com/neovim/nvim-lspconfig",
      wants = { "nvim-lsp-installer" }
    },
    ["nvim-treesitter"] = {
      loaded = true,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
      url = "https://github.com/nvim-treesitter/nvim-treesitter"
    },
    ["nvim-web-devicons"] = {
      loaded = true,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
      url = "https://github.com/kyazdani42/nvim-web-devicons"
    },
    ["packer.nvim"] = {
      loaded = true,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/start/packer.nvim",
      url = "https://github.com/wbthomason/packer.nvim"
    },
    ["plenary.nvim"] = {
      loaded = true,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/start/plenary.nvim",
      url = "https://github.com/nvim-lua/plenary.nvim"
    },
    ["project.nvim"] = {
      loaded = true,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/start/project.nvim",
      url = "https://github.com/ahmedkhalf/project.nvim"
    },
    ["telescope-fzf-native.nvim"] = {
      loaded = true,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
      url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
    },
    ["telescope.nvim"] = {
      loaded = true,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/start/telescope.nvim",
      url = "https://github.com/nvim-telescope/telescope.nvim"
    },
    -- ["tokyonight.nvim"] = {
    --   loaded = true,
    --   path = "/Users/disaza/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    --   url = "https://github.com/folke/tokyonight.nvim"
    -- },
    ["themer"]={ 
      loaded = true,
      url = "https://github.com/ThemerCorp/themer.lua.git",
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/start/themer.lua"
    },
    ["trouble.nvim"] = {
      loaded = true,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/start/trouble.nvim",
      url = "https://github.com/folke/trouble.nvim"
    },
    ["vim-devicons"] = {
      loaded = true,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/start/vim-devicons",
      url = "https://github.com/ryanoasis/vim-devicons"
    },
    ["vim-floaterm"] = {
      loaded = true,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/start/vim-floaterm",
      url = "https://github.com/voldikss/vim-floaterm"
    },
    ["vim-fugitive"] = {
      loaded = true,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/start/vim-fugitive",
      url = "https://github.com/tpope/vim-fugitive"
    },
    ["vim-gist"] = {
      loaded = true,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/start/vim-gist",
      url = "https://github.com/mattn/vim-gist"
    },
    ["vim-gitgutter"] = {
      loaded = true,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/start/vim-gitgutter",
      url = "https://github.com/airblade/vim-gitgutter"
    },
    ["vim-go"] = {
      loaded = true,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/start/vim-go",
      url = "https://github.com/fatih/vim-go"
    },
    ["vim-gutentags"] = {
      loaded = true,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/start/vim-gutentags",
      url = "https://github.com/ludovicchabant/vim-gutentags"
    },
    ["vim-json"] = {
      loaded = true,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/start/vim-json",
      url = "https://github.com/elzr/vim-json"
    },
    ["vim-jsx-improve"] = {
      loaded = true,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/start/vim-jsx-improve",
      url = "https://github.com/neoclide/vim-jsx-improve"
    },
    ["vim-rails"] = {
      loaded = true,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/start/vim-rails",
      url = "https://github.com/tpope/vim-rails"
    },
    ["vim-surround"] = {
      loaded = true,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/start/vim-surround",
      url = "https://github.com/tpope/vim-surround"
    },
    ["vim-test"] = {
      loaded = true,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/start/vim-test",
      url = "https://github.com/vim-test/vim-test"
    },
    ["webapi-vim"] = {
      loaded = true,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/start/webapi-vim",
      url = "https://github.com/mattn/webapi-vim"
    },
    ["which-key.nvim"] = {
      loaded = true,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/start/which-key.nvim",
      url = "https://github.com/folke/which-key.nvim"
    },
    winresizer = {
      loaded = true,
      path = "/Users/disaza/.local/share/nvim/site/pack/packer/start/winresizer",
      url = "https://github.com/simeji/winresizer"
    }
  }
  
  time([[Defining packer_plugins]], false)
  -- Config for: Comment.nvim
  time([[Config for Comment.nvim]], true)
  try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
  time([[Config for Comment.nvim]], false)
  vim.cmd [[augroup packer_load_aucmds]]
  vim.cmd [[au!]]
    -- Event lazy-loads
  time([[Defining lazy-load event autocommands]], true)
  vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-cmp'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
  vim.cmd [[au BufReadPost * ++once lua require("packer.load")({'nvim-lspconfig'}, { event = "BufReadPost *" }, _G.packer_plugins)]]
  time([[Defining lazy-load event autocommands]], false)
  vim.cmd("augroup END")
  if should_profile then save_profiles() end
  
  end)
  
  if not no_errors then
    error_msg = error_msg:gsub('"', '\\"')
    vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
  end