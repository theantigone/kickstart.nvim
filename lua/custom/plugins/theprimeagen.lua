vim.pack.add { 'https://github.com/ThePrimeagen/vim-be-good' }
vim.pack.add { 'https://github.com/nvim-lua/plenary.nvim' }
vim.pack.add { 'https://github.com/ThePrimeagen/refactoring.nvim' }

package.preload['async'] = function()
  return require 'plenary.async'
end
require('refactoring').setup {}
