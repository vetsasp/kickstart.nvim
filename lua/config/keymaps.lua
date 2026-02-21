local map = vim.keymap.set

----- ESSENTIALS -----
map('n', ';', ':', { desc = 'CMD enter command mode' })
-- Better escape from insert and visual mode
-- map({ 'i', 'v' }, 'jk', '<ESC>') -- when I try to select 1 line down, this triggers, so only in insert mode for now
map('i', 'jk', '<ESC>')

----- NAVIGATION -----
-- Start and End of lines
map({ 'n', 'v' }, '<S-H>', '^', { desc = 'Move to first non-space character' })
map({ 'n', 'v' }, '<S-L>', 'g_', { desc = 'Move to last non-space character' })

-- Clear highlights on search when pressing <Esc> in normal mode
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Move selected lines up and down (visual)
map('v', 'K', ":m '<-2<CR>gv=gv")
map('v', 'J', ":m '>+1<CR>gv=gv")

-- 1/2 Pg Up/Dn centers cursor
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')

-- Next/prev buffer
map('n', '<Tab>', '<cmd>bnext<CR>', { desc = 'Next buffer' })
map('n', '<S-Tab>', '<cmd>bprev<CR>', { desc = 'Previous buffer' })

----- IMPROVEMENTS -----
-- Searches centered
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- paste without yanking
map('x', '<leader>p', '"_dP')

-- <leader>l to open Lazy
map('n', '<leader>l', '<cmd>Lazy<CR>', { desc = 'Lazy' })

-- copy all
map('n', '<C-c>', 'gg"+yG', { desc = 'Copy [A]ll to system clipboard' })

-- close current buffer
map('n', '<leader>x', '<cmd>bd<CR>', { desc = 'Close current buffer' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Toggle line comment
map({ 'n', 'v' }, '<leader>/', function()
  vim.cmd 'normal gcc'
end, { desc = 'Toggle comment' })

----- QUICKFIX -----
map('n', '<leader>qd', function()
  vim.diagnostic.setqflist()
  vim.cmd 'copen'
end, { desc = 'Open [D]iagnostic quickfix list' })
map('n', '<leader>qn', '<cmd>cnext<CR>', { desc = 'Go to [N]ext diagnostic in buffer' })
map('n', '<leader>qp', '<cmd>cprev<CR>', { desc = 'Go to [P]revious diagnostic in buffer' })
map('n', '<leader>qq', function()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local ft = vim.api.nvim_get_option_value('filetype', { buf = buf })
    if ft == 'qf' then
      vim.cmd 'cclose'
      return
    end
  end
  vim.cmd 'copen'
end, { desc = 'Toggle [Q]uickfix list' })

-- Keybinds to make split navigation easier.
-- REPLACED BY TMUX NAVIGATOR
--  Use CTRL+<hjkl> to switch between windows
-- map({ 'n', 't' }, '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- map({ 'n', 't' }, '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- map({ 'n', 't' }, '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- map({ 'n', 't' }, '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

map('n', '<leader>fn', function()
  require('snacks').picker.notifications()
end, { desc = 'Show snack notifications' })
