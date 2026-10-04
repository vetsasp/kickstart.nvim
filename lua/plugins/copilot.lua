return {
  'zbirenbaum/copilot.lua',
  enabled = false,
  requires = {
    'copilotlsp-nvim/copilot-lsp', -- (optional) for NES functionality
  },
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function()
    require('copilot').setup {
      panel = {
        auto_refresh = true,
        keymap = {},
      },
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = '<leader><Tab>',
        },
      },
    }

    vim.keymap.set('n', '<leader>ta', function()
      if require('copilot.client').is_disabled() then
        vim.cmd 'Copilot enable'
      else
        vim.cmd 'Copilot disable'
      end
    end, { desc = 'Toggle Copilot' })
    require('which-key').add {
      {
        '<leader>ta',
        desc = function()
          return require('copilot.client').is_disabled() and 'Copilot: Off' or 'Copilot: On'
        end,
      },
    }
  end,
}
