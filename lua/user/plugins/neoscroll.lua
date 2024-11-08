require('neoscroll').setup()

require('neoscroll').setup({
  ['<C-u>'] = { 'scroll', { '-vim.wo.scroll', 'true', '50' } },
  ['<C-d>'] = { 'scroll', { 'vim.wo.scroll', 'true', '50' } },
})
