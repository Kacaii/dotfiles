return {
  "L3MON4D3/LuaSnip",
  opts = function()
    local ls = require("luasnip")
    local s = ls.snippet
    local i = ls.insert_node
    local t = ls.text_node

    ls.add_snippets("javascript", {

      s({ trig = "jsdoc", desc = "Documentation 󰷈" }, {
        t({ "  /**", "  * " }),
        i(1),
        t({ "", "  * ", "  * " }),
        i(2),
        t({ "", "  */ ", "" }),
      }),
    })
  end,
}
