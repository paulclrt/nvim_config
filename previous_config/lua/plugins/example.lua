return {
  -- Add catppuccin theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    flavor = "frappe",
  },

  -- LazyVim with Catppuccin colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
      flavor = "frappe",
    },
  },

  -- Change Trouble configuration (enable diagnostic signs)
  {
    "folke/trouble.nvim",
    opts = { use_diagnostic_signs = true },
  },

  -- Disable Trouble plugin (completely)
  { "folke/trouble.nvim", enabled = false },

  -- Add cmp-emoji to nvim-cmp and configure
  {
  	"hrsh7th/nvim-cmp",
  	dependencies = { "hrsh7th/cmp-emoji" },
  	opts = function(_, opts)
    	-- Ensure opts.sources is a table before inserting
    	opts.sources = opts.sources or {}
    	table.insert(opts.sources, { name = "emoji" })
  	end,
  },



  -- Add pyright to LSP config
  {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      pyright = {},
      tsserver = {},
    },
    setup = {
      tsserver = function(_, opts)
        require("typescript").setup({ server = opts })
        return true
      end,
    },
  },
},


  -- Add tsserver and setup with typescript.nvim instead of lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      init = function()
        require("lazyvim.util").lsp.on_attach(function(_, buffer)
          vim.keymap.set("n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
          vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
        end)
      end,
    },
    opts = {
      servers = { tsserver = {} },
      setup = {
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
      },
    },
  },

  -- Add Treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash", "html", "javascript", "json", "lua", "markdown", "python", "tsx", "typescript", "vim", "yaml",
      },
    },
  },

  -- Add to lualine and customize the configuration
  {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    opts.sections = opts.sections or {}
    opts.sections.lualine_x = opts.sections.lualine_x or {}
    table.insert(opts.sections.lualine_x, function() return "😄" end)
  end,
},


  -- Use mini-starter instead of alpha
  { import = "lazyvim.plugins.extras.ui.mini-starter" },

  -- Add JSONLS and Schemas, and configure Treesitter
  { import = "lazyvim.plugins.extras.lang.json" },

  -- Ensure Mason tools are installed
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua", "shellcheck", "shfmt", "flake8",
      },
    },
  },




  { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true } },
  { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },

  -- Navigation plugins
  { 'nvim-telescope/telescope.nvim', tag = '0.1.2', requires = { 'nvim-lua/plenary.nvim' }, config = function() require('after.plugin.telescope') end },
  { 'theprimeagen/harpoon', config = function() require('after.plugin.harpoon') end },
  { 'christoomey/vim-tmux-navigator' },

  { 'm4xshen/autoclose.nvim' },

  -- Editing plugins
  { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end },
  { 'mg979/vim-visual-multi' },

  -- Completion and LSP
  { 'neovim/nvim-lspconfig', config = function() end },
  { 'hrsh7th/nvim-cmp', config = function() require('after.plugin.nvim-cmp') end },
  { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
  { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
  { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
  { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
  { 'L3MON4D3/LuaSnip' },
  { 'saadparwaiz1/cmp_luasnip' },

  -- Mason & Mason LSP config
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
}

