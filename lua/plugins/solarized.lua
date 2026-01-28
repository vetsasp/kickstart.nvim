return {
  'maxmx03/solarized.nvim',
  lazy = false,
  priority = 1000,
  ---@type solarized.config
  opts = {
    variant = 'autumn',
  },
  config = function(_, opts)
    vim.o.termguicolors = true
    vim.o.background = 'dark'
    require('solarized').setup(opts)
    if vim.g.current_theme == 'solarized' then
      vim.cmd.colorscheme 'solarized'
    end
  end,
}
