return {
  'neanias/everforest-nvim',
  enabled = true,
  version = false,
  lazy = false,
  priority = 1000, -- make sure to load this before all the other start plugins
  -- Optional; default configuration will be used if setup isn't called.
  config = function()
    require('everforest').setup {}
    if vim.g.current_theme == 'everforest' then
      vim.cmd.colorscheme 'everforest'
    end
  end,
}
