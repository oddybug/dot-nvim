local nvim_lsp = require("lspconfig")

return {
  cmd = { "neocmakelsp", "stdio" },
  filetypes = { "cmake" },
  root_dir = function(fname)
    return nvim_lsp.util.find_git_ancestor(fname)
  end,
  single_file_support = true, -- suggested
  on_attach = on_attach, -- on_attach is the on_attach function you defined
  init_options = {
    format = {
      enable = true,
    },
    lint = {
      enable = true,
    },
    scan_cmake_in_package = true, -- default is true
  },
}
