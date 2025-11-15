return {
  -- Highlight todo, notes, etc in comments
  'folke/todo-comments.nvim',
  -- event = 'VimEnter',
  lazy = true,
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = { signs = false },
}
