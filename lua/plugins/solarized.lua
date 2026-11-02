return {
  'maxmx03/solarized.nvim',
  priority = 1000,
  cond = function()
    return not vim.g.vscode and vim.g.current_theme == 'solarized'
  end,
  ---@type solarized.config
  opts = {
    variant = 'autumn',
  },
  config = function(_, opts)
    vim.o.termguicolors = true
    vim.o.background = 'dark'
    require('solarized').setup(opts)
    vim.cmd.colorscheme 'solarized'
  end,
}
