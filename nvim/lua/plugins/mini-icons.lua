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
    },

    extension = {
      db = { glyph = "", hl = "MiniIconsBlue" },
      sqlite = { glyph = "", hl = "MiniIconsBlue" },
      fish = { glyph = "󰈺", hl = "MiniIconsGreen" },
      ["zig.zon"] = { glyph = "" },
    },

    file = {
      [".tmux.conf"] = { glyph = "", hl = "MiniIconsGreen" },
      ["README.md"] = { glyph = "󰂺", hl = "MiniIconsWhite" },

      ["package.json"] = { glyph = "󰏓", hl = "MiniIconsOrange" },
      ["yazi.toml"] = { glyph = "󰇥", hl = "MiniIconsYellow" },

      -- Deno
      ["deno.json"] = { glyph = "", hl = "MiniIconsOrange" },
      ["deno.lock"] = { glyph = "", hl = "MiniIconsBlue" },

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
