require('ibl').setup({
  enabled = true,
  scope = {
    enabled = false,
  },
  indent = {
    char = '▏',
  },
  whitespace = {
    highlight = highlight,
    remove_blankline_trail = false,
  },
  exclude = {
    filetypes = {
      'help',
      'terminal',
      'dashboard',
      'packer',
      'lspinfo',
      'TelescopePrompt',
      'TelescopeResults',
    },
    buftypes = {
      'terminal',
      'NvimTree',
    },
  },
})
