require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  },
  vimgrep_arguments = {
     "rg",
     "--color=never",
     "--no-heading",
     "--with-filename",
     "--line-number",
     "--column",
     "--smart-case",
  },
  winblend = 0,
  border = {},
  borderchars = { "?", "?", "?", "?", "?", "?", "?", "?" },
  color_devicons = true,
  use_less = true,
  set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
  extensions_list = { "themes", "terms" },
}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
require('telescope').load_extension('projects')
