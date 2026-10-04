return {
  'supermaven-inc/supermaven-nvim',
  cond = not vim.g.vscode,
  event = 'BufRead',
  -- enabled = false,
  config = function()
    require('supermaven-nvim').setup {
      keymaps = {
        accept_suggestion = '<leader><Tab>',
      },
    }

    vim.keymap.set('n', '<leader>ta', '<cmd>SupermavenToggle<CR>', { desc = 'Toggle Supermaven' })
    require('which-key').add {
      {
        '<leader>ta',
        desc = function()
          return require('supermaven-nvim.api').is_running() and 'Supermaven: On' or 'Supermaven: Off'
        end,
      },
    }
  end,
}
