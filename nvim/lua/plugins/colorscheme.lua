return {
  "catppuccin",
  -- name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
      light = "latte",
      dark = "mocha",
    },
    transparent_background = false, -- disables setting the background color.
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
      enabled = false, -- dims the background color of inactive window
      shade = "dark",
      percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
      comments = {}, -- Change the style of comments
      conditionals = { "italic" },
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = { "italic" },
      properties = {},
      types = {},
      operators = {},
      -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    color_overrides = {},
    custom_highlights = function(colors)
      return {
        Comment = { fg = colors.overlay0 },
        Pmenu = { fg = colors.text, bg = colors.base },
        PmenuSel = { fg = colors.text, bg = colors.surface0 },
        -- PmenuThumb = { bg = colors.text },
        NormalFloat = { fg = colors.text, bg = colors.base },
      }
    end,
    default_integrations = true,
    integrations = {
      aerial = true,
      alpha = true,
      blink_cmp = true,
      cmp = true,
      dadbod_ui = true,
      dap = true,
      dap_ui = true,
      dashboard = true,
      flash = true,
      fzf = true,
      gitsigns = true,
      grug_far = true,
      harpoon = true,
      markdown = true,
      mason = true,
      navic = { enabled = true, custom_bg = "lualine" },
      neotest = true,
      neotree = true,
      noice = true,
      notify = true,
      nvim_surround = true,
      nvimtree = true,
      octo = true,
      render_markdown = true,
      snacks = true,
      treesitter = true,
      which_key = true,
      indent_blankline = {
        enabled = true,
        scope_color = "lavender", -- catppuccin color (eg. `lavender`) Default: text
        colored_indent_levels = false,
      },
      illuminate = {
        enabled = true,
        lsp = true,
      },
      telescope = {
        enabled = true,
        -- style = "nvchad",
      },
      mini = {
        enabled = true,
        indentscope_color = "",
      },
      -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
  },
}
