return {
  "echasnovski/mini.icons",
  opts = {
    default = {},
    filetype = {},
    lsp = {},
    os = {},

    directory = {
      config = { glyph = "" },
      plugins = { glyph = "󰉓" },
      ["terminal-escape-codes"] = { glyph = "" },
      code = { glyph = "󰉌" },
    },

    extension = {
      php = { glyph = "" },
      db = { glyph = "", hl = "MiniIconsBlue" },
      sqlite = { glyph = "", hl = "MiniIconsBlue" },
      fish = { glyph = "󰈺", hl = "MiniIconsGreen" },
      ["zig.zon"] = { glyph = "" },
    },

    file = {
      ["terminal-colors.json"] = { glyph = "", hl = "MiniIconsBlue" },
      ["terminal-cursor-controls.json"] = { glyph = "", hl = "MiniIconsBlue" },
      ["terminal-general-ascii.json"] = { glyph = "", hl = "MiniIconsBlue" },
      ["terminal-modes.json"] = { glyph = "", hl = "MiniIconsBlue" },

      ["README.md"] = { glyph = "󰂺", hl = "MiniIconsWhite" },

      [".tmux.conf"] = { glyph = "", hl = "MiniIconsGreen" },
      ["yazi.toml"] = { glyph = "󰇥", hl = "MiniIconsYellow" },

      -- Deno
      ["deno.json"] = { glyph = "", hl = "MiniIconsOrange" },
      ["deno.lock"] = { glyph = "", hl = "MiniIconsBlue" },
      ["package.json"] = { glyph = "󰏓", hl = "MiniIconsOrange" },

      -- Lazy
      ["colorscheme.lua"] = { glyph = "", hl = "MiniIconsPurple" },
      ["core.lua"] = { glyph = "", hl = "MiniIconsGreen" },
      ["disable.lua"] = { glyph = "", hl = "MiniIconsRed" },
      ["keymaps.lua"] = { glyph = "󰌌", hl = "MiniIconsOrange" },
      ["lazy.lua"] = { glyph = "󰒲", hl = "MiniIconsPurple" },
      ["options.lua"] = { glyph = "", hl = "MiniIconsOrange" },
      ["autocmds.lua"] = { glyph = "", hl = "MiniIconsOrange" },
      -- Lazy.plugins
      ["blink-cmp.lua"] = { glyph = "󱐀", hl = "MiniIconsPurple" },
      ["mini-icons.lua"] = { glyph = "", hl = "MiniIconsPurple" },
      ["tmux-navigator.lua"] = { glyph = "", hl = "MiniIconsGreen" },
    },
  },
}
