return {
  "MeanderingProgrammer/render-markdown.nvim",
  opts = {
    heading = {
      enabled = true,
      sign = true,
      left_pad = 1,
      position = "inline",
      icons = { "󰎤", "󰎧", "󰎪", "󰎭", "󰎱", "󰎳" },
      signs = { "󰫎 " },
      border = false,
    },
    code = {
      sign = false,
      style = "full",
      position = "left",
      language_name = true,
      width = "block",
      border = "thick",
      left_pad = 2,
      right_pad = 4,
      language_pad = 2,
    },
  },
}
