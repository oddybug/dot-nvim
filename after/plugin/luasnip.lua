local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local extras = require("luasnip.extras")
local rep = extras.rep

ls.add_snippets("cpp", {
  s("class", {
    t("class "),
    i(1, "MyClass"),
    t("{\nprivate:\n\npublic:\n"),
    t("\t"),
    rep(1),
    t("();\n"),
    t("\t"),
    rep(1),
    t("();\n}"),
  }),
})
