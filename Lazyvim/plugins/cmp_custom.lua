-- File: lua/plugins/cmp_custom.lua

return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    -- Customize the appearance of the completion window and documentation window
    opts.window = {
      completion = {
        border = "rounded", -- Adds rounded borders to the completion menu
      },
      documentation = {
        border = "rounded", -- Adds rounded borders to the documentation window
      },
    }
  end,
}
