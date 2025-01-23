return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",

  keys = {
    {
      -- Open in current file 󰇥

      -- "<leader>-",
      "<leader>e",
      "<cmd>Yazi<cr>",
      desc = "Open Yazi 󰇥 at the current File",
    },
    {
      -- Open in the current working directory 󰇥

      -- "<leader>cw",
      "<leader>E",
      "<cmd>Yazi cwd<cr>",
      desc = "Open Yazi 󰇥 in CWD",
    },
    {
      -- Resume last session 󰇥

      -- "<c-up>",
      "<leader>-",
      "<cmd>Yazi toggle<cr>",
      desc = "Resume the last Yazi 󰇥 session",
    },
  },

  opts = {
    -- if you want to open yazi instead of netrw, see below for more info

    open_for_directories = true,
    floating_window_scaling_factor = 0.8,

    keymaps = {
      show_help = "<f1>",
    },
  },
}
