vim.pack.add { 'https://github.com/ThePrimeagen/vim-be-good' }
vim.pack.add { 'https://github.com/nvim-lua/plenary.nvim' }
vim.pack.add { 'https://github.com/ThePrimeagen/refactoring.nvim' }

vim.api.nvim_create_autocmd('PackLoad', {
  pattern = 'refactoring.nvim',
  callback = function()
    package.preload['async'] = function()
      return require 'plenary.async'
    end
    require('refactoring').setup {}
  end,
})