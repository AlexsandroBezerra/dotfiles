return {
  'joeveiga/ng.nvim',
  config = function()
    local opts = { noremap = true, silent = true }

    local ng = require 'ng'

    vim.keymap.set('n', '<leader>nt', ng.goto_template_for_component, {
      desc = 'Go to template',
    })
    vim.keymap.set('n', '<leader>nc', ng.goto_component_with_template_file, {
      desc = 'Go to component',
    })
    vim.keymap.set('n', '<leader>nT', ng.get_template_tcb, {
      desc = 'Get Template',
    })
  end,
}
