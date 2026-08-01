vim.pack.add { 'https://github.com/nvim-lua/plenary.nvim' }

package.preload['async'] = function() return require 'plenary.async' end
