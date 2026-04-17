local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "ruff_format" },
    sql = { "sqlfluff" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier" },
    json = { "prettier" },
    rust = { "rustfmt" },
    sh = { "shfmt" },
  },

  formatters = {
    sqlfluff = {
      command = "sqlfluff",
      args = { "format", "--dialect", "postgres", "-" },
    },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
