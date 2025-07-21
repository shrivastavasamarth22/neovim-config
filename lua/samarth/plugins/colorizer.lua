return {
  "NvChad/nvim-colorizer.lua",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("colorizer").setup({
      filetypes = {
        "*", -- Enable for all filetypes by default
        "!lazy", -- Disable for lazy.nvim
        "!mason", -- Disable for mason
        "!help", -- Disable for help files
        "!startup", -- Disable for startup screens
        "!checkhealth", -- Disable for checkhealth
        css = { rgb_fn = true }, -- Enable parsing rgb(...) functions in css
        html = { names = false }, -- Disable parsing "names" like Blue
        javascript = { tailwind = true }, -- Enable tailwind colors
        typescript = { tailwind = true }, -- Enable tailwind colors
        javascriptreact = { tailwind = true },
        typescriptreact = { tailwind = true },
      },
      user_default_options = {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = true, -- "Name" codes like Blue or blue
        RRGGBBAA = false, -- #RRGGBBAA hex codes
        AARRGGBB = false, -- 0xAARRGGBB hex codes
        rgb_fn = false, -- CSS rgb() and rgba() functions
        hsl_fn = false, -- CSS hsl() and hsla() functions
        css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Available modes for `mode`: foreground, background,  virtualtext
        mode = "background", -- Set the display mode
        -- Available methods are false / true / "normal" / "lsp" / "both"
        tailwind = false, -- Enable tailwind colors
        -- parsers can contain values used in |user_default_options|
        sass = { enable = true, parsers = { "css" } }, -- Enable sass colors
        virtualtext = "■",
        -- update color values even if buffer is not focused
        always_update = false,
      },
      -- all the sub-options of filetypes apply to buftypes
      buftypes = {},
    })

    -- Set up keymaps
    vim.keymap.set("n", "<leader>ct", "<cmd>ColorizerToggle<cr>", { desc = "Toggle colorizer" })
    vim.keymap.set("n", "<leader>cr", "<cmd>ColorizerReloadAllBuffers<cr>", { desc = "Reload colorizer for all buffers" })
  end,
}
