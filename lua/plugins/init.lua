return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    config = function()
      require "configs.null-ls"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "python",
        "sql",
        "dockerfile",
        "json",
        "yaml",
        "diff",
        "markdown_inline",
        "rust",
        "toml",
      },
    },
  },

  {
    "ellisonleao/glow.nvim",
    config = true,
    cmd = "Glow",
  },

  -- Claude
  {
    "greggh/claude-code.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require "configs.claude-code"
    end,
  },

  -- Copilot
  {
    "zbirenbaum/copilot.lua",
    -- lazy = false,
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require "configs.copilot"
    end,
  },

  -- Copilot Chat
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    lazy = false,
    branch = "main",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    build = "make tiktoken",
    config = function()
      require "configs.copilot-chat"
    end,
  },

  -- Folder tree
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require "configs.nvim-tree"
    end,
  },

  -- Code folding
  {
    "kevinhwang91/nvim-ufo",
    lazy = false,
    dependencies = "kevinhwang91/promise-async",
    config = function()
      require "configs.nvim-ufo"
    end,
  },

  -- Command line suggestions
  {
    "gelguy/wilder.nvim",
    lazy = false,
    config = function()
      require "configs.wilder"
    end,
  },

  -- Neogit
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = true,
    lazy = false,
  },

  --   -- Sessions
  --   {
  --     "rmagatti/auto-session",
  --     lazy = false,
  --
  --     ---enables autocomplete for opts
  --     ---@module "auto-session"
  --     ---@type AutoSession.Config
  --     opts = {
  --       suppressed_dirs = { "~/", "~/Documents", "~/Downloads", "/" },
  --       -- log_level = 'debug',
  --     },
  --   },
}
