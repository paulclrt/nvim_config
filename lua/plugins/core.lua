return {
  -- Gestionnaire de plugins
  -- { "folke/lazy.nvim" },

  -- Navigation
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ci", telescope.lsp_incoming_calls, { desc = "LSP incoming calls" })
    end
  },
  { 
    "theprimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} }, { "nvim-tree/nvim-web-devicons" } },
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  },
  { "christoomey/vim-tmux-navigator" },

  -- Édition
  { "numToStr/Comment.nvim", opts = {} },
  { "m4xshen/autoclose.nvim" },
  { "mg979/vim-visual-multi" },
  {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },

  
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    -- Gestionnaire de plugins
    { "folke/lazy.nvim" },
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "bash", "html", "javascript", "json", "lua",
        "markdown", "python", "tsx", "typescript", "vim", "yaml"
      },
      highlight = { enable = true }
    }
  },



  {
    "folke/flash.nvim",
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "flash" },
      -- { "s", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "flash treesitter" },
      -- { "r", mode = "o", function() require("flash").remote() end, desc = "remote flash" },
      -- { "r", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "treesitter search" },
      -- { "<C-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "toggle flash search" },
    },
  }

}
