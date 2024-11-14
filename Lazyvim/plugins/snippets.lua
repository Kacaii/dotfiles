return {
  "L3MON4D3/LuaSnip",
  opts = function()
    local ls = require("luasnip")
    local s = ls.snippet
    local i = ls.insert_node
    local t = ls.text_node

    ls.add_snippets("javascript", {

      s({ trig = "jsd", desc = "Javascript Documentation  " }, {
        t({ "  /**", "  * " }),
        i(1),
        t({ "", "  * ", "  * " }),
        i(2),
        t({ "", "  */ " }),
      }),
      s({ trig = "ijsd", desc = "Inline Javascript Documentation  " }, {
        t({ "  /** " }),
        i(1),
        t({ " */" }),
      }),
      s({ trig = "cdb", desc = "Add CodeBlock   " }, {
        t({ "```" }),
        i(1),
        t({ "", "* " }),
        i(2),
        t({ "", "* ```" }),
      }),
      s({ trig = "cc", desc = "Clear the Console 󰆍 " }, {
        t("console.clear()"),
      }),
    })
  end,
}
