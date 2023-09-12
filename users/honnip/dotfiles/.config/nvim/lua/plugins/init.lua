return {
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup({
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      })
    end,
  },

  {
    "kylechui/nvim-surround",
    config = true,
  },

  {
    "echasnovski/mini.move",
    config = function()
      require("mini.move").setup()
    end,
  },

  {
    "akinsho/nvim-toggleterm.lua",
    opts = { open_mapping = [[<c-\>]] },
  },

  "jose-elias-alvarez/typescript.nvim",

  { "b0o/schemastore.nvim", event = "VeryLazy" },

  {
    "kosayoda/nvim-lightbulb",
    event = "VeryLazy",
    opts = { autocmd = { enabled = true } },
  },

  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    event = "VimEnter",
    dependencies = { "zbirenbaum/copilot-cmp" },
    config = function()
      vim.defer_fn(function()
        require("copilot").setup({
          suggestion = { enabled = false },
          panel = { enabled = false },
        })
      end, 100)
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup({
        method = "getCompletionsCycling",
      })
    end,
  },

  -- keymap
  { "folke/which-key.nvim", event = "VeryLazy", opts = { spelling = true } },

  -- tree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
        view = {
          width = 25,
        },
        filters = {
          custom = {
            "node_modules",
            "dist",
            "__pycache__",
            ".git",
          },
        },
        git = {
          ignore = false,
        },
      })
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        indent = {
          enable = true,
        },
      })
      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("file_browser")
    end,
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup({})
    end,
  },

  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup()
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true,
        disable_filetype = { "TelescopePrompt" },
      })
    end,
  },
}
