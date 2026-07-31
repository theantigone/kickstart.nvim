vim.pack.add { 'https://github.com/brianhuster/live-preview.nvim' }

require('livepreview').setup({
  picker = 'native',
})

vim.api.nvim_create_user_command('LivePreview', function()
  require('livepreview').preview_file()
end, {})
