-- Fix for clangd AST errors after file saves
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = { '*.c', '*.cpp', '*.h', '*.hpp' },
  group = vim.api.nvim_create_augroup('clangd-reload-fix', { clear = true }),
  callback = function()
    -- Only reload if clangd is attached to this buffer
    local clients = vim.lsp.get_clients { bufnr = 0, name = 'clangd' }
    if #clients > 0 then
      vim.cmd 'silent! edit'
    end
  end,
})

-- Set default tab behavior for file opening
vim.api.nvim_create_autocmd('VimEnter', {
  group = vim.api.nvim_create_augroup('default-tab-behavior', { clear = true }),
  callback = function()
    -- Override the default edit command to use tabedit
    vim.api.nvim_create_user_command('E', 'tabedit <args>', { nargs = '?', complete = 'file' })
    
    -- Set switchbuf to use tabs for quickfix and location lists
    vim.opt.switchbuf = 'usetab,newtab'
  end,
})
