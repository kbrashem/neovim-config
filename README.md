# Neovim config

## Install

1. Install neovim i.e. `sudo apt install neovim` or `brew install neovim` or `sudo dnf install neovim`
1. Install nerdfont `wget -P ~/.local/share/fonts_tmp https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip && unzip ~/.local/share/fonts_tmp/JetBrainsMono.zip -d ~/.local/share/fonts_tmp && mkdir -p ~/.local/share/fonts && mv ~/.local/share/fonts_tmp/JetBrainsMonoNerdFont-\* ~/.local/share/fonts && rm -rf ~/.local/share/fonts_tmp && fc-cache -fv'
1. Choose nerdfont in terminal settings
1. `git clone https://github.com/kbrashem/neovim-config.git ~/.config/nvim`
1. Open neovim `nvim` and Lazy will install plugins
1. Run `:MasonInstallAll` to install all mason dependencies (LSPs and formatters)
1. Authenticate github copilot `:Copilot auth` if necessary

## nvim shortcuts

### General

- `Ctrl + n` - Toggle file explorer
- `Alt + h` - Open terminal below
- `<leader> + h` - Open new terminal below
- `:noa w` - Save without autoformat
- `<leader> + ch` - Open cheatsheet
- `:Telescope keymaps` - Show keymaps

### LSP

- `:LspInfo` - Show LSP information
- `gd` - Go to definition
- `K` - Hover
- `Ctrl + e` - Exit suggestions

### Copilot

- `Ctrl + f` - Trigger completion
- `Alt + ]` - Suggest another completion
- `:CopilotChat <message>` - Send a message to Copilot
- `:CopilotChat` - Open chat window

### Conform

- `:Conform` - See the logs

### Fold

- `za` - Toggle Fold
- `zc` - Close Fold
- `zo` - Open Fold
- `zA` - Open all Folds
- `zM` - Close all Folds
