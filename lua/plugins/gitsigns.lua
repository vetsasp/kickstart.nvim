return { -- Adds git related signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  cond = not vim.g.vscode,
  event = 'BufRead',
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    on_attach = function(bufnr)
      local gitsigns = require 'gitsigns'

      local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
      end

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal { ']c', bang = true }
        else
          gitsigns.nav_hunk 'next'
        end
      end, 'Jump to next git change')

      map('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal { '[c', bang = true }
        else
          gitsigns.nav_hunk 'prev'
        end
      end, 'Jump to previous git change')

      -- Actions
      map('v', '<leader>hs', function()
        gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, 'Stage selected hunk')
      map('v', '<leader>hr', function()
        gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, 'Reset selected hunk')

      map('n', '<leader>hs', gitsigns.stage_hunk, 'Stage hunk')
      map('n', '<leader>hr', gitsigns.reset_hunk, 'Reset hunk')
      map('n', '<leader>hS', gitsigns.stage_buffer, 'Stage buffer')
      map('n', '<leader>hu', gitsigns.undo_stage_hunk, 'Undo stage hunk')
      map('n', '<leader>hR', gitsigns.reset_buffer, 'Reset buffer')
      map('n', '<leader>hp', gitsigns.preview_hunk, 'Preview hunk')
      map('n', '<leader>hb', gitsigns.blame_line, 'Blame line')
      map('n', '<leader>hd', gitsigns.diffthis, 'Diff against index')
      map('n', '<leader>hD', function()
        gitsigns.diffthis '@'
      end, 'Diff against last commit')

      -- Toggles
      map('n', '<leader>tb', gitsigns.toggle_current_line_blame, 'Toggle line blame')
      map('n', '<leader>tD', gitsigns.preview_hunk_inline, 'Toggle deleted lines preview')
    end,
  },
}
