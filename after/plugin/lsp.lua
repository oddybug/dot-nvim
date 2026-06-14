local lspconfig = require("lspconfig")
local cmp_lsp = require("cmp_nvim_lsp")

-- Pass autocompletion capabilities to your language servers
local capabilities = cmp_lsp.default_capabilities()

-- Initialize your language servers
lspconfig.lua_ls.setup({ capabilities = capabilities })
lspconfig.clangd.setup({ capabilities = capabilities })
lspconfig.astro.setup({ capabilities = capabilities })
lspconfig.omnisharp.setup({ capabilities = capabilities })
lspconfig.ts_ls.setup({ capabilities = capabilities })

-- Initialize CMake with your custom external configuration file
local cmake_config = require("lsp.cmake")
cmake_config.capabilities = capabilities
lspconfig.cmake.setup(cmake_config)

-- Diagnostic layouts & signs configuration
vim.diagnostic.config({
  virtual_lines = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
      [vim.diagnostic.severity.WARN] = "WarningMsg",
    },
  },
})

-- Remappings applied dynamically ONLY when an LSP attaches to a buffer
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local map = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end

    map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
    map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
    map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
    map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
    map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
    map(
      "<leader>ws",
      require("telescope.builtin").lsp_dynamic_workspace_symbols,
      "[W]orkspace [S]ymbols"
    )
    map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
    map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
    map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
    map("<leader>e", vim.diagnostic.open_float, "[e]rror or warning")
  end,
})
