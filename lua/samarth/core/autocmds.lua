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

-- Auto-center cursor on screen (disabled - using scrolloff instead)
-- Uncomment below if you want the autocmd version back
--[[
local last_center_time = 0
local center_debounce_ms = 100 -- Debounce centering for 100ms

vim.api.nvim_create_autocmd({ 'CursorMoved' }, {
  group = vim.api.nvim_create_augroup('auto-center-cursor', { clear = true }),
  callback = function()
    -- Skip if in a floating window (like Telescope, LSP hover, etc.)
    if vim.api.nvim_win_get_config(0).relative ~= '' then
      return
    end
    
    -- Skip for specific buffer types that shouldn't be centered
    local buftype = vim.bo.buftype
    local filetype = vim.bo.filetype
    if buftype == 'prompt' or buftype == 'nofile' or 
       filetype == 'TelescopePrompt' or filetype == 'TelescopeResults' or
       filetype == 'lazy' or filetype == 'mason' then
      return
    end
    
    -- Debounce to avoid jittery scrolling
    local current_time = vim.uv.now()
    if current_time - last_center_time < center_debounce_ms then
      return
    end
    
    -- Get current window height and cursor position
    local winheight = vim.fn.winheight(0)
    local winline = vim.fn.winline()
    
    -- Define the threshold (how close to edges before centering)
    local threshold = math.floor(winheight * 0.25) -- 25% from top/bottom
    
    -- Center if cursor is too close to top or bottom
    if winline <= threshold or winline >= (winheight - threshold) then
      vim.cmd('normal! zz')
      last_center_time = current_time
    end
  end,
})
--]]
