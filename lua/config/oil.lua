
require("oil").setup({
  columns = {
    "icon",
    -- "permissions",
    -- "size",
    -- "mtime",
  },
  skip_confirm_for_simple_edits = false,
  prompt_save_on_select_new_entry = true,
  keymaps = {
    ["<CR>"] = "actions.select", -- open file or folder
    ["<C-p>"] = "actions.preview",
    ["<C-l>"] = "actions.refresh",
    ["-"] = { "actions.parent", mode = "n" },
    -- ["`"] = { "actions.cd", mode = "n" },
    -- ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
    -- ["<C-c>"] = { "actions.close", mode = "n" },
    -- ["<leader>pv"] = { "actions.open_cwd", mode = "n" },
    -- ["g?"] = { "actions.show_help", mode = "n" },
    -- ["<C-s>"] = { "actions.select", opts = { vertical = true } },
    -- ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
    -- ["<C-t>"] = { "actions.select", opts = { tab = true } },
    -- ["gs"] = { "actions.change_sort", mode = "n" },
    -- ["gx"] = "actions.open_external",
    -- ["g."] = { "actions.toggle_hidden", mode = "n" },
    -- ["g\\"] = { "actions.toggle_trash", mode = "n" },
  },
  -- Set to false to disable all of the above keymaps
  -- use_default_keymaps = false,
  view_options = {
    show_hidden = true,
  }
})

vim.keymap.set("n", "<leader>pv", "<cmd>Oil<CR>", { desc = "Open Oil" })
