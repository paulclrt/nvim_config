-- ~/.config/nvim/init.lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Configuration de base avant le chargement des plugins
vim.g.mapleader = " "
vim.g.lazyvim_check_order = false                                                                                                       

require("config.options") -- Vos options personnalisées
require("config.keymaps") -- Vos raccourcis personnalisés

require("lazy").setup({
  spec = {

    -- Vos plugins personnalisés
    { import = "plugins" },

    -- Extensions LazyVim (optionnel)
    -- { import = "lazyvim.plugins.extras.ui.mini-starter" },
    -- { import = "lazyvim.plugins.extras.lang.json" },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  -- install = {
  --   colorscheme = { "catppuccin" }, -- Votre thème préféré
  -- },
  checker = { enabled = false},
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },

  {
      "pmizio/typescript-tools.nvim",
      dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
      opts = {},
  },
})





-- cmp, lsp, mason
require("config.nvim-cmp")
require("config.config_treesitter")
require("config.nvim-lspconfig")
require("config.telescope")
require("config.harpoon")
require("config.typescript-lsp")
require("config.oil")
require("config.autoclose")
require("config.luasnip")

