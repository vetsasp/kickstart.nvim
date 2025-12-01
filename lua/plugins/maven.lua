return {
  'supermaven-inc/supermaven-nvim',
  keymaps = {
    accept_suggestion = '<leader><Tab>',
  },
  config = function()
    require('supermaven-nvim').setup {}
  end,
}
