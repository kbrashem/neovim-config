local tree = require "nvim-tree"
tree.setup {
  filters = {
    dotfiles = false,
    git_ignored = false,
  },
  hijack_directories = {
    enable = false,
    auto_open = false,
  },
}
