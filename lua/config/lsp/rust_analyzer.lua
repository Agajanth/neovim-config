local M = {}
local nvim_lsp = require('lspconfig')
local cmp_capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

nvim_lsp.flow.setup {
  on_attach = on_attach,
  capabilities = capabilities
}


function M.setup(on_attach)
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
  nvim_lsp.rust_analyzer.setup {
    cmd = {
      "rust-analyzer"
    },
    filetypes = {
      "rust"
    },
    flags = {
      debounce_text_changes = 150
    },
    on_attach = on_attach,
    root_dir = nvim_lsp.util.root_pattern("Cargo.toml", "rust-project.json"),
    capabilities = cmp_capabilities,
    handlers = handlers,
    settings = {
      solargraph = {
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
