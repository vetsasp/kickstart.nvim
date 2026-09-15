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
  end,
}
