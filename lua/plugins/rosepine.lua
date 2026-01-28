return {
  'rose-pine/neovim',
  name = 'rose-pine',
  priority = 1000,
  cond = function()
    return vim.g.current_theme == 'rose-pine'
  end,
  config = function()
    require('rose-pine').setup {}
    vim.cmd.colorscheme 'rose-pine'
  end,
}
