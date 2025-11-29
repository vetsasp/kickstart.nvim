return {
  -- NOTE: Highlight todo, notes, etc in comments
  'folke/todo-comments.nvim',
  event = 'VeryLazy',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    -- signs = false,
  },
}

-- NOTE: note
-- INFO: info
-- TODO: todo
-- TEST: test
-- PERF: performance
-- PERFORMANCE: performance
-- OPTIM: optimize
-- OPTIMIZE: optimize
-- HACK: hack
-- WARN: warning
-- WARNING: warning
-- XXX: xxx
-- FIX: fix
-- BUG: bug
-- ISSUE: issue
-- FIXME: fixme
