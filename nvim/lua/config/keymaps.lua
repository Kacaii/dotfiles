-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- Add any additional keymaps here

local keymap = vim.keymap
-- local opts = { noremap = true, silent = true }

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G", { noremap = true, silent = true, desc = "[󰒉] Select all" })

-- Edit ColorScheme
keymap.set(
  "n",
  "<leader>uu",
  "<cmd>e ~/.config/nvim/lua/plugins/colorscheme.lua<CR>",
  { noremap = true, silent = true, desc = "[] Update ColorScheme" }
)

-- Split window
-- keymap.set("n", "ss", ":vsplit<Return>", opts)
-- keymap.set("n", "sv", ":split<Return>", opts)

-- Diagnostics
-- keymap.set("n", "<leader>xj", function()
--   vim.diagnostic.goto_next()
-- end, vim.tbl_extend("force", opts, { desc = "Next diagnostic" }))
