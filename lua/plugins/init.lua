return {
  {
    "stevearc/conform.nvim",
    event = { 'BufWritePre', 'BufNewFile', 'BufRead' }, -- Load on file open
    config = function()
      require "configs.conform"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "typescript-language-server",
        "prettier",
        "eslint_d",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", "javascript", "typescript", "tsx",
        "json", "markdown", "markdown_inline"
      },
    },
  },

  -- Git integration
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "󰍵" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "│" },
      },
    },
  },

  {
    "tpope/vim-fugitive",
    cmd = { "Git", "Gdiffsplit", "Gread", "Gwrite", "Ggrep" },
  },

  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose" },
  },

  -- Auto pairs and surround
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end
  },

  -- Better commenting
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n", desc = "Comment toggle current line" },
      { "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
      { "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
    },
    config = function()
      require("Comment").setup()
    end,
  },

  -- Multiple cursors
  {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
  },

  -- Better search and replace
  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    opts = { open_cmd = "noswapfile vnew" },
  },

  -- Session management
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = { options = vim.opt.sessionoptions:get() },
  },

  -- Trouble for diagnostics
  {
    "folke/trouble.nvim",
    cmd = { "Trouble" },
    lazy = false, -- Load immediately instead of waiting
    opts = {
      focus = true, -- Focus the trouble window when opened
    },
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },

  -- Main Copilot plugin
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<M-l>",      -- Alt+L to accept suggestion
            accept_word = "<M-w>", -- Alt+W to accept word
            next = "<M-]>",        -- Alt+] for next suggestion
            prev = "<M-[>",        -- Alt+[ for previous suggestion
            dismiss = "<C-]>",     -- Ctrl+] to dismiss
          },
        },
        panel = { enabled = false }, -- Disable panel for cleaner experience
        server_opts_overrides = {},
      })
    end,
  },

  -- Copilot Chat for interactive AI assistance
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    config = function()
      require("CopilotChat").setup({
        debug = false,
        show_help = "yes",
        prompts = {
          Explain = "Please explain how the following code works.",
          Review = "Please review the following code and provide suggestions for improvement.",
          Tests = "Please explain how the selected code works, then generate unit tests for it.",
          Refactor = "Please refactor the following code to improve its clarity and readability.",
          FixCode = "Please fix the following code to make it work as intended.",
          BetterNamings = "Please provide better names for the following variables and functions.",
          Documentation = "Please provide documentation for the following code.",
          SwaggerApiDocs = "Please provide documentation for the following API using Swagger.",
          SwaggerJSDocs = "Please write JSDoc for the following API using Swagger.",
        },
      })
    end,
    keys = {
      { "<leader>cc", "<cmd>CopilotChat<cr>", desc = "Copilot Chat" },
      { "<leader>ce", "<cmd>CopilotChatExplain<cr>", desc = "Copilot Explain", mode = {"n", "v"} },
      { "<leader>cr", "<cmd>CopilotChatReview<cr>", desc = "Copilot Review", mode = {"n", "v"} },
      { "<leader>cf", "<cmd>CopilotChatFixCode<cr>", desc = "Copilot Fix", mode = {"n", "v"} },
      { "<leader>co", "<cmd>CopilotChatOptimize<cr>", desc = "Copilot Optimize", mode = {"n", "v"} },
      { "<leader>cd", "<cmd>CopilotChatDocumentation<cr>", desc = "Copilot Docs", mode = {"n", "v"} },
      { "<leader>ct", "<cmd>CopilotChatTests<cr>", desc = "Copilot Tests", mode = {"n", "v"} },
    },
  },
}
