local chat = require "CopilotChat"

chat.setup {
  debug = true,
  context = "buffers",
  window = {
    layout = "vertical",
    width = 0.2,
  },
}
