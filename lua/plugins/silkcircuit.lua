return {
  'hyperb1iss/silkcircuit-nvim',
  lazy = false,
  priority = 1000,
  cond = function()
    return vim.g.current_theme == 'silkcircuit'
  end,
  config = function()
    require('silkcircuit').setup {
      integrations = {
        all = false,
      },
    }
    vim.cmd.colorscheme 'silkcircuit'
  end,
}
