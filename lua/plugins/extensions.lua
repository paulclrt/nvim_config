return {
  -- Gestionnaire de plugins

  -- gitsigns
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      signs_staged = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },      signs_staged_enable = true,
      numhl = false,
      linehl = false,
      signcolumn = true,



      current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
        use_focus = true,
      },
      current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil, -- Use default
      max_file_length = 40000, -- Disable if file is longer than this (in lines)
      preview_config = {
        -- Options passed to nvim_open_win
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
      },


      on_attach = function(bufnr)
        local gs = require("gitsigns")
        local function map(mode, lhs, rhs, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, lhs, rhs, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal({']c', bang = true})
          else
            gs.next_hunk()
          end
        end)
        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal({'[c', bang = true})
          else
            gs.prev_hunk()
          end
        end)

        -- Actions
        map('n', '<leader>hs', gs.stage_hunk)
        map('n', '<leader>hr', gs.reset_hunk)
        map('v', '<leader>hs', function() gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end)
        map('v', '<leader>hr', function() gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end)
        map('n', '<leader>hS', gs.stage_buffer)
        map('n', '<leader>hR', gs.reset_buffer)
        map('n', '<leader>hp', gs.preview_hunk)
        map('n', '<leader>hi', gs.preview_hunk_inline)
        map('n', '<leader>hb', function() gs.blame_line({ full = true }) end)
        map('n', '<leader>hd', gs.diffthis)
        map('n', '<leader>hD', function() gs.diffthis('~') end)
        map('n', '<leader>hQ', function() gs.setqflist('all') end)
        map('n', '<leader>hq', gs.setqflist)

        -- Toggles
        map('n', '<leader>tb', gs.toggle_current_line_blame)
        map('n', '<leader>tw', gs.toggle_word_diff)

        -- Text object
        map({'o', 'x'}, 'ih', gs.select_hunk)
      end
    }
  },

  -- diffview
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local diffview = require("diffview")
      vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "Git diff" })
      vim.keymap.set("n", "<leader>gD", "<cmd>DiffviewClose<CR>", { desc = "Close diffview" })
      vim.keymap.set("n", "<leader>gf", "<cmd>DiffviewToggleFiles<CR>", { desc = "Toggle file panel" })
    end,
  },

  {
    "rbong/vim-flog",
    lazy = false,
    cmd = { "Flog" },
    dependencies = {
      "tpope/vim-fugitive",
    },
    config = function()
      require("lazy").load({ plugins = { "vim-flog" } })
      vim.keymap.set("n", "<leader>gj", "<cmd>Flog<CR>", { desc = "Flog - git tree viewer" })
    end,
  },

}

