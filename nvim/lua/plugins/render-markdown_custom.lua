return {
  "MeanderingProgrammer/render-markdown.nvim",
  opts = {

    heading = {
      enabled = true,
      sign = true,
      left_pad = 1,
      position = "inline",
      icons = {
        "▒▒▒ ",
        "▒▒▒▒ ",
        "▒▒▒▒▒ ",
        "▒▒▒▒▒▒ ",
        "▒▒▒▒▒▒▒ ",
        "▒▒▒▒▒▒▒▒ ",
      },
      signs = { "󰫎 " },
      border = false,
    },

    code = {
      sign = false,
      style = "normal",
      position = "left",
      language_name = false,
      width = "block",
      border = "thick",
      left_pad = 2,
      right_pad = 4,
      language_pad = 2,
    },

    bullet = {
      icons = { "", "" },
    },

    checkbox = {
      enabled = true,
      unchecked = {
        icon = "",
      },
      checked = {
        icon = "",
      },
    },
  },
}
