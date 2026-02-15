local function maximize_status()
  return vim.t.maximized and '   ' or ''
end

return {
  -- Thème
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({ flavor = "frappe" })
      vim.cmd.colorscheme("catppuccin")
    end
  },


  --log editing
  {
    'fei6409/log-highlight.nvim',
    opts = {},
  },

  --git conflicts
  {'akinsho/git-conflict.nvim', version = "*", config = true},
  -- please read the doc to understand: https://github.com/akinsho/git-conflict.nvim?tab=readme-ov-file

  -- Dépannage
  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },

  -- Barre de statut
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        sections = {
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = { maximize_status },
          -- lualine_x = {'encoding', 'fileformat', 'filetype'}
          lualine_x = { function() return "😄" end }
        }
      })
    end
  },

  {
    'declancm/maximize.nvim',
    config = true
  }

}
