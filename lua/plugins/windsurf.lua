return {
  'Exafunction/windsurf.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
  },
  enabled = false,
  config = function()
    require('codeium').setup {
      virtual_text = {
        enabled = true,
        key_bindings = {
          accept = '<leader><Tab>',
        },
      },
    }

    vim.keymap.set('n', '<leader>ta', '<cmd>Codeium Toggle<CR>', { desc = 'Toggle Windsurf' })
    require('which-key').add {
      {
        '<leader>ta',
        desc = function()
          return require('codeium').s.enabled and 'Windsurf: On' or 'Windsurf: Off'
        end,
      },
    }
  end,
}
