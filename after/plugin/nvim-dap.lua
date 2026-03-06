local dap = require('dap')

local dapui = require('dapui')
dapui.setup()

local function cmake_target()
  local cmake = require("cmake-tools")
  local success, launch_path = pcall(cmake.get_launch_target_path)

  if success and launch_path and launch_path ~= "" then
    return launch_path
  end

  return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
end

dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = 'codelldb',
    args = { "--port", "${port}" },
  },
}

-- dap.configurations.cpp = {
--   {
--     name = "Launch",
--     type = "codelldb", -- Use the CodeLLDB adapter
--     request = "launch",
--     program = cmake_target, -- Your existing function
--     cwd = "${workspaceFolder}/build",
--     stopOnEntry = false,
--   },
-- }

-- Reuse the same config for C and Rust
dap.configurations.c = dap.configurations.cpp
-- dap.configurations.rust = dap.configurations.cpp

-- F5 to start or continue
vim.keymap.set("n", "<F5>", function()
  dap.continue()
end, { desc = "Debug: Start/Continue" })

-- Stepping functions
vim.keymap.set("n", "<F3>", function()
  dap.step_over()
end, { desc = "Debug: Step Over" })
vim.keymap.set("n", "<F2>", function()
  dap.step_into()
end, { desc = "Debug: Step Into" })
vim.keymap.set("n", "<F4>", function()
  dap.step_out()
end, { desc = "Debug: Step Out" })

-- Stop/Restart
vim.keymap.set("n", "<leader>dq", function()
  dap.terminate()
end, { desc = "Debug: Terminate" })
vim.keymap.set("n", "<F6>", function()
  dap.restart()
end, { desc = "Debug: Restart" })

-- Breakpoints
vim.keymap.set("n", "<leader>b", function()
  dap.toggle_breakpoint()
end, { desc = "Debug: Toggle Breakpoint" })
vim.keymap.set("n", "<leader>B", function()
  dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Debug: Set Conditional Breakpoint" })

-- UI Toggle (in case it doesn't auto-open or you close it accidentally)
vim.keymap.set("n", "<leader>du", function()
  dapui.toggle()
end, { desc = "Debug: Toggle UI" })

-- Hover to see variable value under cursor
vim.keymap.set("n", "<leader>dh", function()
  require("dap.ui.widgets").hover()
end, { desc = "Debug: Hover Value" })

vim.fn.sign_define("DapBreakpoint", {
  text = " ●", -- This is your "dot"
  texthl = "DapBreakpoint",
  linehl = "",
  numhl = "DapBreakpoint",
})

vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#e06c75", bg = "NONE" })

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end
