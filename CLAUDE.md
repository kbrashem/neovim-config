# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Neovim configuration based on NvChad framework that provides a comprehensive development environment with LSP support, code formatting, Git integration, and AI assistance.

### Core Architecture

- **Base Framework**: NvChad v2.5 provides the foundation
- **Plugin Management**: Lazy.nvim handles all plugin installations and loading
- **Configuration Structure**:
  - `init.lua` - Entry point that bootstraps Lazy and loads core modules
  - `lua/chadrc.lua` - NvChad theme and UI configuration
  - `lua/options.lua` - Custom Neovim options and autocommands  
  - `lua/mappings.lua` - Custom key mappings
  - `lua/plugins/init.lua` - Plugin specifications and configurations
  - `lua/configs/` - Individual plugin configuration files

### Key Plugin Integrations

- **LSP**: Configured for Python (Pyright), Terraform, YAML, Docker, C/C++ (clangd)
- **Formatting**: Conform.nvim with language-specific formatters (stylua, ruff, prettier, rustfmt, etc.)
- **Git**: Neogit for Git operations, DiffView for diff visualization
- **AI Assistance**: 
  - GitHub Copilot with CopilotChat for code completion and chat
  - Claude Code integration via claude-code.nvim plugin
- **Code Intelligence**: Treesitter for syntax highlighting, nvim-ufo for code folding
- **File Management**: nvim-tree file explorer (auto-opens on startup)

## Development Commands

### Setup Requirements
1. Install Neovim, nerd font, clone repo to `~/.config/nvim`
2. Run `:MasonInstallAll` to install LSPs and formatters
3. Authenticate Copilot with `:Copilot auth`

### Key Operations
- **Save without autoformat**: `:noa w`
- **LSP Information**: `:LspInfo`
- **Format manually**: `:Conform`
- **View format logs**: `:Conform` (see the logs)
- **Copilot Chat**: `:CopilotChat <message>` or `:CopilotChat` for chat window

### File Structure Notes
- Plugin configurations are modularized in `lua/configs/`
- All plugins defined in `lua/plugins/init.lua` follow lazy-loading patterns
- Format-on-save is enabled by default with 500ms timeout
- Claude Code is configured for vertical split at 20% width with specific keymaps

### Key Mappings Integration
- Leader key: `<Space>`
- Claude Code toggle: `<C-,>` (both normal and terminal mode)
- Claude Code continue: `<leader>cC`
- Claude Code verbose: `<leader>cV`
- Neogit: `<leader>ng`
- DiffView: `<leader>do` (open), `<leader>dc` (close)

### Language Support
Configured LSPs and formatters for: Lua, Python, SQL, CSS, HTML, JavaScript, JSON, Rust, Shell, Terraform, YAML, Docker, C/C++