local keymap = vim.keymap
-- local opts = { noremap = true, silent = true }

-- Exit INSERT mode by double tapping `j`
keymap.set("i", "jj", "<Esc>", { noremap = false })

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
