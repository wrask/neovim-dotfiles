local lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
local path_to_elixirls = vim.fn.expand("/Users/romandunik/Desktop/elixir-ls/release/language_server.sh")

lspconfig.elixirls.setup({
  cmd = {path_to_elixirls},
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    elixirLS = {
      dialyzerEnabled = false,
      fetchDeps = false
    }
  }
})
