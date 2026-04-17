require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.configs.lspconfig"

local servers = {
  html = {},
  cssls = {},
  pyright = { filetypes = { "python" } },
  terraformls = { filetypes = { "terraform" } },
  dockerls = { filetypes = { "Dockerfile", "dockerfile" } },
  clangd = { filetypes = { "cpp", "c" } },
  yamlls = {
    filetypes = { "yaml" },
    settings = {
      yaml = { format = { enable = true } },
    },
  },
}

for name, cfg in pairs(servers) do
  vim.lsp.config(
    name,
    vim.tbl_extend("force", {
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
    }, cfg)
  )
  vim.lsp.enable(name)
end
