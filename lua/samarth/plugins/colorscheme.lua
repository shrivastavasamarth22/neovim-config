return {
  {
    "craftzdog/solarized-osaka.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    lazy = false,
    config = function()
      require("solarized-osaka").setup({
        transparent = false,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          sidebars = "dark",
          floats = "dark",
        }
      })
    end,
  },

  {
    "ribru17/bamboo.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("bamboo").setup({
        style = "multiplex",
        transparent = false,
        term_colors = true,

        code_style = {
          comments = { italic = true },
          conditionals = { italic = true },
          keywords = {},
          functions = {},
          namespaces = { italic = true },
          parameters = { italic = true },
          strings = {},
          variables = {},
        },
      })
    end
  },
  {
    "sainnhe/gruvbox-material",
    enabled = true,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_transparent_background = 0
      vim.g.gruvbox_material_foreground = "mix"
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_ui_contrast = "high"
      vim.g.gruvbox_material_float_style = "bright"
      vim.g.gruvbox_material_statusline_style = "mix" -- Options: "original", "material", "mix", "afterglow"
      vim.g.gruvbox_material_cursor = "auto"

      -- vim.g.gruvbox_material_colors_override = { bg0 = '#16181A' } -- #0e1010
      -- vim.g.gruvbox_material_better_performance = 1


      -- Custom statusline highlights
      vim.api.nvim_set_hl(0, "StatusLine", {
        bg = "#1C2021", -- Dark gray background
        fg = "#ebdbb2", -- Light text
        bold = false
      })

      vim.api.nvim_set_hl(0, "StatusLineNC", {
        bg = "#1C2021", -- Darker background for inactive windows
        fg = "#928374", -- Muted text
        bold = false
      })
    end,
  },
  {
    "cormacrelf/dark-notify",
    config = function()
      require("dark_notify").run()
    end,
  },

  {
    'datsfilipe/vesper.nvim',
    lazy = false,
    priotity = 1000,
    config = function()
      require("vesper").setup({
        transparent = false,
        italics = {
          comments = true,
          keywords = true,
          functions = true,
          strings = true,
          variables = true,
        }
      })
    end
  },

  {
    "ptdewey/darkearth-nvim",
    priority = 1000,
  },

  {
    "ficcdaf/ashen.nvim",
    lazy = false,
    priotity = 1000,
    opts = {
      style_presets = {
        italic_comments = true,
        italic_keywords = true,
        italic_functions = true,
        italic_strings = true,
      }
    }
  },

  {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
        themes = {
          "ashen",
          "bamboo",
          "darkearth",
          "gruvbox-material",
          "solarized-osaka",
          "vesper",
        },
        livePreview = true, -- Enable live preview of themes
      })
    end
  }
}
