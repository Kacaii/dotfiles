return {

  {
    -- Customization
    "folke/noice.nvim",
    opts = {
      presets = {
        bottom_search = false,
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
    },
  },

  {
    "folke/noice.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.routes, {
        {
          filter = {
            event = "notify",
            any = {
              { find = "No information available" },
            },
          },
          skip = true,
        },
      })
    end,
  },

  -- {
  --   -- Disabling "No information available" notification
  --   "folke/noice.nvim",
  --   opts = function(_, opts)
  --     table.insert(opts.routes, {
  --       filter = {
  --         event = "notify",
  --         find = "No information available",
  --       },
  --       opts = { skip = true },
  --     })
  --   end,
  -- },
}
