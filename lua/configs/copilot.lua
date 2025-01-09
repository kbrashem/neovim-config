local copilot = require "copilot"

copilot.setup {
  suggestion = {
    auto_trigger = true,
    keymap = {
      accept = "<C-f>",
      next = "<A-]>",
      prev = "<A-[>",
    },
  },
  filetypes = {
    yaml = true,
    markdown = true,
  },
}
