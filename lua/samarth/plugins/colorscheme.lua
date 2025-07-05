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
          comments = {italic = true},
          keywords = {italic = true},
          sidebars = "dark",
          floats = "dark",
        }
      })
      -- load the colorscheme here
      vim.cmd([[colorscheme solarized-osaka]])
    end,
  },
}
