return {

  { "nvim-lua/plenary.nvim" },

  -- Aesthetics

  { "xiyaowong/transparent.nvim" },

  -- Debugger

  { "mfussenegger/nvim-dap" },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
    },
  },

  -- CMake utils
  {
    "Civitasv/cmake-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      cmake_build_directory = "build", -- Where your binaries go
      cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" },
      cmake_build_options = { "-j10" },
    },
  },

  -- package manager stuff

  { "williamboman/mason.nvim" },

  { "WhoIsSethDaniel/mason-tool-installer.nvim" },

  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },

  -- Git utils

  { "f-person/git-blame.nvim" },

  { "lewis6991/gitsigns.nvim" },

  { "tpope/vim-fugitive" },

  -- miscelaneaus

  { "folke/which-key.nvim" },

  --editor

  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },

  { "nvim-telescope/telescope.nvim" },

  -- Code snippets

  { "L3MON4D3/LuaSnip" },

  { "danymat/neogen", config = true },

  -- Autocompletion

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      "L3MON4D3/LuaSnip",

      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      "hrsh7th/cmp-nvim-lsp",
    },
  },

  -- Autoformatter

  { "stevearc/conform.nvim", opts = {} },

  --colorschemes

  {
    "Mofiqul/vscode.nvim",
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      vim.cmd.colorscheme("lackluster-mint")
      vim.cmd.hi("Comment gui=none")
    end,
  },

  { "rebelot/kanagawa.nvim" },

  { "datsfilipe/vesper.nvim" },

  { "slugbyte/lackluster.nvim" },

  { "ember-theme/nvim" },

  --lsp

  { "neovim/nvim-lspconfig" },

  -- Highlight todo, notes, etc in comments
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
  },

  { -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
}
