-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Split window
keymap.set("n", "ss", ":vsplit<Return>", opts)
keymap.set("n", "sv", ":split<Return>", opts)

keymap.del("n", "<C-f>")
keymap.set("n", "<C-f>", ":FzfLua files<Return>", vim.tbl_extend("force", opts, { desc = "󰈞 Find Files" }))

-- Diagnostics
keymap.set("n", "<leader>xj", function()
  vim.diagnostic.goto_next()
end, vim.tbl_extend("force", opts, { desc = " Next diagnostic" }))
