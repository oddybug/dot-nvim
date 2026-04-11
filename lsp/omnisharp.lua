local mason_bin_path = vim.fn.stdpath("data") .. "/mason/packages/omnisharp/libexec/OmniSharp.dll"

require("lspconfig").omnisharp.setup({
  cmd = { "dotnet", mason_bin_path },

  filetypes = { "cs" },
  enable_import_completion = true,
  organize_imports_on_format = true,
  enable_roslyn_analyzers = true,

  -- Ensure it finds your project root
  root_dir = function(fname)
    return require("lspconfig").util.root_pattern(
      "*.sln",
      "*.csproj",
      "omnisharp.json",
      "function.json"
    )(fname)
  end,
})
