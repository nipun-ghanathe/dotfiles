return {
  -- -- Functions
  -- s(
  --   { trig = "def", desc = "Python function" },
  --   fmt("def {}({}){}:\n\t{}", {
  --     i(1, "func"),
  --     i(2),
  --     c(3, {
  --       sn(nil, { t(" -> "), i(1, "None") }),
  --       t(""),
  --     }),
  --     c(4, {
  --       i(1, "pass"),
  --       sn(nil, { t('"""'), i(1), t('"""') }),
  --     }),
  --   })
  -- ),

  -- Ignoring errors from LSPs, Linters and Type Checkers
  s(
    { trig = "#pyright-ignore-line", desc = "Ignore a Pyright diagnostic for the line" },
    fmt("# pyright: ignore[{}]", { i(0) })
  ),
  s(
    { trig = "#mypy-ignore-line", desc = "Ignore a mypy diagnostic for the line" },
    fmt("# type: ignore[{}]", { i(0) })
  ),
  s(
    { trig = "#mypy-ignore-file", desc = "Ignore a mypy diagnostic for the file" },
    fmt('# mypy: disable-error-code="{}"', { i(0) })
  ),
  s(
    { trig = "#ruff-ignore-line", desc = "Ignore a Ruff diagnostic for the line" },
    fmt("# noqa: {}", { i(0) })
  ),
  s(
    { trig = "#ruff-ignore-file", desc = "Ignore a Ruff diagnostic for the file" },
    fmt("# noqa: {}", { i(0) })
  ),
}
