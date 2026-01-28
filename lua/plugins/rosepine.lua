return {
  'rose-pine/neovim',
  name = 'rose-pine',
  config = function()
    require('rose-pine').setup {}
    if vim.g.current_theme == 'rose-pine' then
      vim.cmd.colorscheme 'rose-pine'
    end
  end,
}
