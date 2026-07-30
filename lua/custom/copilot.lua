vim.pack.add { 'https://github.com/zbirenbaum/copilot.lua' }
vim.api.nvim_create_autocmd('PackLoad', {
  pattern = 'copilot.lua',
  callback = function()
    require('copilot').setup({
      suggestion = {
        enabled = not vim.g.ai_cmp,
        auto_trigger = false,
        hide_during_completion = vim.g.ai_cmp,
        keymap = { accept = false, next = '<M-]>', prev = '<M-[>' },
      },
      panel = { enabled = false },
      filetypes = { markdown = true, help = true },
    })
  end,
})

vim.pack.add { 'https://github.com/CopilotC-Nvim/CopilotChat.nvim' }
vim.api.nvim_create_autocmd('PackLoad', {
  pattern = 'CopilotChat.nvim',
  callback = function()
    local user = vim.env.USER or 'User'
    user = user:sub(1, 1):upper() .. user:sub(2)
    require('CopilotChat').setup({
      auto_insert_mode = true,
      headers = { user = '  ' .. user .. ' ', assistant = '  Copilot ', tool = '󰊳  Tool ' },
      window = { width = 0.4 },
    })

    vim.keymap.set('n', '<c-s>', '<CR>', { remap = true, desc = 'Submit Prompt' })
    vim.keymap.set({'n', 'x'}, '<leader>a', '', { desc = '+ai' })
    vim.keymap.set({'n', 'x'}, '<leader>aa', function() return require('CopilotChat').toggle() end, { desc = 'Toggle (CopilotChat)' })
    vim.keymap.set({'n', 'x'}, '<leader>ax', function() return require('CopilotChat').reset() end, { desc = 'Clear (CopilotChat)' })
    vim.keymap.set({'n', 'x'}, '<leader>aq', function()
      vim.ui.input({ prompt = 'Quick Chat: ' }, function(input)
        if input ~= '' then require('CopilotChat').ask(input) end
      end)
    end, { desc = 'Quick Chat (CopilotChat)' })
    vim.keymap.set({'n', 'x'}, '<leader>ap', function() require('CopilotChat').select_prompt() end, { desc = 'Prompt Actions (CopilotChat)' })

    vim.api.nvim_create_autocmd('BufEnter', {
      pattern = 'copilot-chat',
      callback = function()
        vim.opt_local.relativenumber = false
        vim.opt_local.number = false
      end,
    })
  end,
})\n