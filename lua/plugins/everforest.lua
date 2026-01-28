return {
  'neanias/everforest-nvim',
  version = false,
  priority = 1000, -- make sure to load this before all the other start plugins
  cond = function()
    return vim.g.current_theme == 'everforest'
  end,
  -- Optional; default configuration will be used if setup isn't called.
  config = function()
    require('everforest').setup {}
    vim.cmd.colorscheme 'everforest'
  end,
}
