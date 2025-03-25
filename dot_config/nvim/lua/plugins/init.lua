return {
  {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      -- Disable default `<Tab>` mapping to avoid conflicts
      vim.g.copilot_no_tab_map = true
      -- Set custom keybinding for accepting suggestions
      vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { expr = true, silent = true })
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- Recommended
    lazy = false, -- This plugin is already lazy
  },
  {
    "justinmk/vim-sneak",
    lazy = false,
    config = function()
      -- Optional: Add any additional custom configuration for Sneak here
    end,
  },
  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      -- vim.g.vimtex_view_method = "firefox"
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_view_method = "general"
      vim.g.vimtex_view_general_viewer = "okular"
      vim.g.vimtex_compiler_latexmk = {
        executable = "latexmk",
        build_dir = "", -- Optional: Use a build directory
        options = {
          "-shell-escape", -- Enable shell escape
          "-synctex=1", -- Enable SyncTeX
          "-pdf",
          "-lualatex",
        },
      }
    end,
  },
  -- Lua
  {
    "folke/zen-mode.nvim",
    opts = {},
    config = true,
  },
  {
    "CRAG666/code_runner.nvim",
    lazy = false,
    config = true,
    filetype_path = vim.fn.expand "~/.config/nvim/code_runner.json",
  },
  { -- This plugin
    "Zeioth/compiler.nvim",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
    opts = {},
  },
  { -- The task runner we use
    "stevearc/overseer.nvim",
    commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    opts = {
      task_list = {
        direction = "bottom",
        min_height = 25,
        max_height = 25,
        default_detail = 1,
      },
    },
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    lazy = false,
  },
  -- Add nvim-dap
  {
    "mfussenegger/nvim-dap",
    lazy = false,
  },

  -- Optional: Virtual text for breakpoints
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
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
        "toml",
        "c_sharp",
        "haskell",
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "pyre",
        "clangd",
        "clang-format",
        "codelldb",
        "rust-analyzer",
      },
    },
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {}
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      local config = require "nvchad.configs.nvimtree"
      config.filters.dotfiles = true
      return config
    end,
  },
}
