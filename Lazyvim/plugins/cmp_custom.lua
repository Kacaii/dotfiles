return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local mocha = require("catppuccin.palettes").get_palette("mocha")

      -- Customize the appearance of the completion window and documentation window
      opts.window = {
        completion = {
          border = "rounded", -- Adds rounded borders to the completion menu
          winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,Search:None",
        },
        documentation = {
          border = "rounded", -- Adds rounded borders to the documentation window
          winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,Search:None",
        },
      }

      -- Apply the background color from the Catppuccin Mocha palette
      vim.api.nvim_set_hl(0, "Pmenu", { bg = mocha.base })
      vim.api.nvim_set_hl(0, "FloatBorder", { bg = mocha.base, fg = mocha.subtext0 })
    end,
  },
  {
    -- Adding cmp-cmdline
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-cmdline" },
    opts = function(_, opts)
      local cmp = require("cmp")

      table.insert(opts.sources, { name = "cmdline" })

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
