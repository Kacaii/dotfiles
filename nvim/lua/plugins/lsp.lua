return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        fish_lsp = {
          cmd = {
            "/home/linuxbrew/.linuxbrew/bin/fish-lsp",
            "start",
          },
          filetypes = { "fish" },
          root_dir = require("lspconfig").util.find_git_ancestor,
          single_file_support = true,
        },
      },
    },
  },
}
