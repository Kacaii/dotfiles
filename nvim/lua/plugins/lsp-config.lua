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
          -- require("lspconfig").util.find_git_ancestor,
          root_dir = vim.fs.dirname(vim.fs.find(".git", { path = startpath, upward = true })[1]),
          single_file_support = true,
        },
      },
    },
  },
}
