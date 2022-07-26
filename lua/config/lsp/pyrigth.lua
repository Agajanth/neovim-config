local M = {}
local nvim_lsp = require('lspconfig')
function M.setup(on_attach)

local cmp_capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

nvim_lsp.flow.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

  local handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
		underline = true,
		signs = true,
        update_in_insert = true,
      }
    )
  }
  --local capabilities = vim.lsp.protocol.make_client_capabilities()
  nvim_lsp.pyright.setup {
    cmd = {
        "pyright-langserver",
        "--stdio" },
    filetypes = {
      "python"
    },
    flags = {
      debounce_text_changes = 150
    },
    on_attach = on_attach,
    root_dir = nvim_lsp.util.root_pattern(".py", "__init__.py", ".git", ".toml","venv", "requirements.txt"),
    capabilities = cmp_capabilities,
    handlers = handlers,
    settings = {
      python = {
        analysis = {
            autoSearchPaths = true,
            diagnosticMode = "workspace",
            useLibraryCodeForTypes = true
          },
        autoformat = true,
        completion = true,
        diagnostic = true,
        folding = true,
        references = true,
        rename = true,
        symbols = true
      }
    }
  }
end

return M
