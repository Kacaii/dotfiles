return {
  {
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
  },
  {
    -- Addind cmp-cmdline
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-cmdline" },
    opts = function(_, opts)
      local cmp = require("cmp")

      table.insert(opts.sources, { name = "hrsh7th/cmp-cmdline" })

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- Setup for `:` to use cmdline and path sources
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })
    end,
  },
}
