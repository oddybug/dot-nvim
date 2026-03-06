require("nvim-dap-virtual-text").setup({
    enabled = true,                        -- enable this plugin (default)
    enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, etc.
    highlight_changed_variables = true,    -- highlight changed values with a different color
    highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables
    show_stop_reason = true,               -- show stop reason when stopped for exceptions
    commented = true,                      -- prefix virtual text with comment string

    -- Customize the appearance
    display_callback = function(variable, buf, stackframe, node, options)
      if options.virt_text_pos == 'inline' then
        return ' = ' .. variable.value
      else
        return variable.name .. ' = ' .. variable.value
      end
    end,

    -- position of virtual text, see `:h nvim_buf_set_extmark()`
    virt_text_pos = 'eol',                 -- 'eol' (end of line) or 'inline'
})
