return {
  -- LuaSnip
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    }
  },
  -- { "rafamadriz/friendly-snippets" },
  {
    "williamboman/mason-lspconfig.nvim",
  },

  -- Gestionnaire LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    }
  },

  -- for errors that overflow lsp
  -- {
  --   "Maan2003/lsp_lines.nvim",
  --   config = function()
  --     require("lsp_lines").setup()
  --   end,
  -- },

  -- Completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-emoji"
    },
    config = function() require("config.nvim-cmp") end
  },

  -- Outils Mason
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "pyright"
      }
    }
  },

  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  }
}
