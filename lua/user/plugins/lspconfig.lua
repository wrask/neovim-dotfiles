-- ElixirLS (Neovim 0.11+ core LSP API)
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local path_to_elixirls = vim.fn.expand("/Users/romandunik/Desktop/elixir-ls/release/language_server.sh")

-- on_attach must be defined before configuring/enabling servers
local on_attach = function(_, bufnr)
  local map = function(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, buffer = bufnr })
  end

  map("n", "df", function() vim.lsp.buf.format({ async = true }) end)
  map("n", "gd", vim.lsp.buf.definition)
  map("n", "K", vim.lsp.buf.hover)
  map("n", "gi", vim.lsp.buf.implementation)
  map("n", "<c-k>", vim.lsp.buf.signature_help)
  map("n", "1gD", vim.lsp.buf.type_definition)
  map("n", "gl", vim.diagnostic.open_float)
end

-- Global defaults for all servers
vim.lsp.config("*", {
  capabilities = capabilities,
  on_attach = on_attach,
})

-- Per-server config for ElixirLS
vim.lsp.config("elixirls", {
  cmd = { path_to_elixirls },
  settings = {
    elixirLS = {
      dialyzerEnabled = false,
      fetchDeps = false,
    },
  },
})

-- Enable server
vim.lsp.enable("elixirls")

-- nvim-cmp
local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<Esc>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = "nvim_lsp" },
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_text",
      menu = {
        nvim_lsp = "[LSP]",
      },
    }),
  },
})
