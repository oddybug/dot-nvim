require("mason-tool-installer").setup({
  ensure_installed = {
    -- LSPs
    "lua-language-server",
    "vim-language-server",
    "clangd",

    -- Formatters/Linters
    "clang-format",
    "prettier",
    "prettierd",
    "stylua",
    "eslint_d",
    "shellcheck",

    -- Debuggers
    "codelldb"
  },

  auto_update = true,
  run_on_start = true,
})
