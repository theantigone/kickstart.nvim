vim.pack.add { 'https://github.com/geg2102/nvim-jupyter-client' }
vim.api.nvim_create_autocmd('PackLoad', {
  pattern = 'nvim-jupyter-client',
  callback = function() require('nvim-jupyter-client').setup {} end,
})

