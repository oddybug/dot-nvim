return {
  cmd = { "vtsls" , "--stdio" },
  typescript = {
    inlayHints = {
      parameterNames = { enabled = "all" },
      parameterTypes = { enabled = true },
    },
    suggest = {
      completeFunctionCalls = true,
    },
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
}
