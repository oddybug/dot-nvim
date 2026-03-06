require("cmake-tools").setup({
  cmake_dap_configuration = {
    name = "cpp",
    type = "codelldb", -- Matches the adapter name we defined earlier
    request = "launch",
    stopOnEntry = false,
    runInTerminal = true,
  },
})
