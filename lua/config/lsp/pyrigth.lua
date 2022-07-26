ocal M = {}
local nvim_lsp = require('lspconfig')
local coq = require("coq")
function M.setup(on_attach)
  local handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
		underline = true,
		signs = true,
        update_in_insert = false,
      }
    ):
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
    root_dir = nvim_lsp.util.root_pattern("Gemfile", ".git", ".toml","venv", "requirements.txt"),
    capabilities = coq.lsp_ensure_capabilities(
      vim.tbl_deep_extend("force", {
      on_attach = lsp_on_attach,
      capabilities = capabilities,
      flags = {debounce_text_changes = 150},
      init_options = config
      }, {})),
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
