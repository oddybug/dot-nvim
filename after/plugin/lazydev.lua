require("lazydev").setup({
  library = {
    { path = "luvit-meta/library", words = { "vim%.uv" } },
    { path = "nvim-dap", words = { "dap" } },
    { path = "nvim-dap-ui", words = { "dapui" } },
  },
})
