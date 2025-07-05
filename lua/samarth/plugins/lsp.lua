return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
        },
        ts_ls = {},
        eslint = {},
        tailwindcss = {},
        pyright = {},
        html = {},
        cssls = {},
        jsonls = {},
        emmet_ls = {},
        clangd = {},
      },
    },
    config = function(_, opts)
      require("mason").setup()

      require("mason-lspconfig").setup({
        ensure_installed = {
          'pyright',        -- Python
          'ts_ls',       -- TypeScript
          'eslint',         -- JavaScript
          'html',           -- HTML
          'cssls',          -- CSS
          'tailwindcss',    -- Tailwind CSS
          'clangd',         -- C++
          'jsonls',         -- jsonls
          'emmet_ls',       -- emmet_ls
          'lua_ls',         -- lua
        },      })

      for server, config in pairs(opts.servers) do
        vim.lsp.config(server, config)
        vim.lsp.enable(server)
      end

    end
  },
}
