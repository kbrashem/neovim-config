require("mason").setup()

require("mason-null-ls").setup {
  ensure_installed = {
    "stylua",
    "jq",
    "lua-language-server",
    "html-lsp",
    "css-lsp",
    "prettier",
    "pyright",
    "mypy",
    "ruff",
    "black",
    "terraform-ls",
    "yaml-language-server",
    "sqlfluff",
    "dockerfile-language-server",
    "isort",
  },
  automatic_installation = true,
  handlers = {},
}

require("null-ls").setup {
  sources = {
    -- Anything not supported by mason.
  },
}

-- local opts = {
--   sources = {
--     null_ls.builtins.diagnostics.mypy,
--     null_ls.builtins.diagnostics.ruff,
--   },
-- }
