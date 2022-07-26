local M = {}

local servers = {
  gopls = {},
  html = {},
  jsonls = {},
  sumneko_lua = {},
  tsserver = {},
  vimls = {},
  solargraph = {},
}

local function on_attach(client, bufnr)
  -- Enable completion triggered by <C-X><C-O>
  -- See `:help omnifunc` and `:help ins-completion` for more information.
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Use LSP as the handler for formatexpr.
  -- See `:help formatexpr` for more information.
  vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")

  -- Configure key mappings
  require("config.lsp.keymaps").setup(client, bufnr)

  print("LSP Server Ready")
end

local function getOptions()
  local handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        underline = true,
        signs = true,
        update_in_insert = false,
      }
    )
  }
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  local opts = {
    on_attach = on_attach,
    handlers = handlers,
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = capabilities,
  }

  return opts
end

function M.setup()
  require("config.lsp.installer").setup(servers, getOptions())
  require("config.lsp.solargraph").setup(on_attach)
  require("config.lsp.pyright").setup(on_attach)
end

return M
