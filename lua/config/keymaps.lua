local map = vim.keymap.set

map('n', ';', ':', { desc = 'CMD enter command mode' })

-- Better escape from insert and visual mode
map({ 'i', 'v' }, 'jk', '<ESC>')

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

-- Searches centered
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- paste without yanking
map('x', '<leader>p', '"_dP')

-- Toggle line comment
map({ 'n', 'v' }, '<leader>/', function()
  vim.cmd 'normal gcc'
end, { desc = 'Toggle comment' })

-- <leader>l to open Lazy
map('n', '<leader>l', '<cmd>Lazy<CR>', { desc = 'Lazy' })

-- open floating terminal
-- map({ 'n', 't' }, '<leader>ft', '<cmd>Floaterminal<CR>', { desc = 'Toggle floating terminal' })

-- copy all
map('n', '<C-c>', 'gg"+yG', { desc = 'Copy [A]ll to system clipboard' })

-- close current buffer
map('n', '<leader>x', '<cmd>bd<CR>', { desc = 'Close current buffer' })

-- Diagnostic keymaps
map('n', '<leader>qq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
map({ 'n', 't' }, '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map({ 'n', 't' }, '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map({ 'n', 't' }, '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map({ 'n', 't' }, '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
