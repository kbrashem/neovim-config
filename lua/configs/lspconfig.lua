-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })
end

-- python
vim.lsp.config("pyright", {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = { "python" },
})

-- terraform
vim.lsp.config("terraformls", {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = { "terraform" },
})

-- yaml
vim.lsp.config("yamlls", {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = { "yaml" },
  settings = {
    yaml = {
      format = {
        enable = true,
      },
    },
  },
})

-- docker
vim.lsp.config("dockerls", {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = { "Dockerfile", "dockerfile" },
})

-- cpp
vim.lsp.config("clangd", {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = { "cpp", "c" },
})

-- rust
-- lspconfig.rustanalyzer.setup {
--   on_attach = nvlsp.on_attach,
--   capabilities = nvlsp.capabilities,
--   filetypes = { "rust" },
--   settings = {
--     ["rust-analyzer"] = {
--       assist = {
--         importGranularity = "module",
--         importPrefix = "by_self",
--       },
--       cargo = {
--         loadOutDirsFromCheck = true,
--       },
--       procMacro = {
--         enable = true,
--       },
--     },
--   },
-- }
