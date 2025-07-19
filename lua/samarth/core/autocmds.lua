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

-- Auto-center cursor on screen
vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
  group = vim.api.nvim_create_augroup('auto-center-cursor', { clear = true }),
  callback = function()
    -- Get current window height and cursor position
    local winheight = vim.fn.winheight(0)
    local winline = vim.fn.winline()
    
    -- Define the threshold (how close to edges before centering)
    local threshold = math.floor(winheight * 0.25) -- 25% from top/bottom
    
    -- Center if cursor is too close to top or bottom
    if winline <= threshold or winline >= (winheight - threshold) then
      vim.cmd('normal! zz')
    end
  end,
})
