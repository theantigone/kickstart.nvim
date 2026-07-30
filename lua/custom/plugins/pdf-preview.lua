vim.pack.add { 'https://github.com/franco-ruggeri/pdf-preview.nvim' }
vim.api.nvim_create_autocmd('PackLoad', {
  pattern = 'pdf-preview.nvim',
  callback = function()
    require('pdf-preview').setup({})
  end,
})\n