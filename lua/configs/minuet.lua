require("minuet").setup {
  provider = "claude",
  provider_options = {
    claude = {
      model = "claude-haiku-4-5",
      max_tokens = 256,
      api_key = "ANTHROPIC_API_KEY",
    },
  },
  notify = "debug",
  virtualtext = {
    show_on_completion_menu = true,
    auto_trigger_ft = {
      "lua",
      "python",
      "sql",
      "css",
      "html",
      "javascript",
      "typescript",
      "json",
      "rust",
      "sh",
      "terraform",
      "yaml",
      "dockerfile",
      "c",
      "cpp",
    },
    keymap = {
      accept = "<C-f>",
      accept_line = "<C-l>",
      next = "<C-]>",
      prev = "<C-[>",
      dismiss = "<C-e>",
    },
  },
}
