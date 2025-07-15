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
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
          },
          init_options = {
            usePlaceholders = true,
            completeUnimported = true,
            clangdFileStatus = true,
          },
          filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
          root_dir =  function(fname)
            local lspconfig = require("lspconfig")
            return lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git", "Makefile")(fname)
            
          end
        },
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
