require("mason-tool-installer").setup({
  ensure_installed = {
    -- LSPs
    "lua-language-server",
    "vim-language-server",
    "clangd",
    "neocmakelsp",
    "omnisharp",

    -- Formatters/Linters
    "clang-format",
    "prettier",
    "prettierd",
    "stylua",
    "eslint_d",
    "shellcheck",
    "cmakelang",

    -- linters
    "cmakelint",

    -- Debuggers
    "codelldb",
  },

  auto_update = true,
  run_on_start = true,
})
