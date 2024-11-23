return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      denols = {
        settings = {
          deno = {
            enable = true,
            lint = true,
            inlayHints = {
              parameterNames = {
                enabled = "all", -- Options: "all", "none", "literals"
              },
              parameterTypes = {
                enabled = false,
              },
              variableTypes = {
                enabled = true,
              },
              functionReturnTypes = {
                enabled = true,
              },
            },
          },
        },
      },
    },
  },
}
