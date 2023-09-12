return {
  {
    "sainnhe/everforest",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      local g = vim.g
      vim.o.termguicolors = true
      g.everforest_background = "soft"
      g.everforest_better_performance = 1
      g.everforest_enable_italic = 1
      g.everforest_ui_contrast = "low"
      vim.cmd([[colorscheme everforest]])
    end,
  },
  {
    "sainnhe/sonokai",
    enabled = true,
    lazy = false,
    priority = 1000,
    config = function()
      local g = vim.g
      vim.o.termguicolors = true
      g.sonokai_style = "andromeda"
      g.sonokai_better_performance = 1
      g.sonokai_enable_italic = 1
      g.sonokai_diagnostic_text_highlight = 1
      g.sonokai_diagnostic_virtual_text = "colored"
      vim.cmd([[colorscheme sonokai]])
    end,
  },
}
