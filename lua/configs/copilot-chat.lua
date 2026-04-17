local chat = require "CopilotChat"

chat.setup {
  debug = false,
  context = "buffers",
  window = {
    layout = "vertical",
    width = 0.2,
  },
}
