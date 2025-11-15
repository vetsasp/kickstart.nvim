local map = vim.keymap.set

map('n', ';', ':', { desc = 'CMD enter command mode' })
map('i', 'jk', '<ESC>')

-- Start and End of lines
map('n', '<S-H>', '^', { desc = 'Move to first non-space character' })
map('n', '<S-L>', 'g_', { desc = 'Move to last non-space character' })
map('v', '<S-H>', '^', { desc = 'Move to first non-space character' })
map('v', '<S-L>', 'g_', { desc = 'Move to last non-space character' })

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Move selected lines up and down (visual)
map('v', 'K', ":m '<-2<CR>gv=gv")
map('v', 'J', ":m '>+1<CR>gv=gv")

-- 1/2 Pg Up/Dn centers cursor
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')

-- Next buffer
map('n', '<Tab>', '<cmd>bnext<CR>', { desc = 'Next buffer' })

-- Searches centered
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- paste without yanking
map('x', '<leader>p', '"_dP')

-- Toggle line comment
map('n', '<leader>/', function()
  vim.cmd 'normal gcc'
end, { desc = 'Toggle comment' })

map('v', '<leader>/', function()
  vim.cmd 'normal gcc'
end, { desc = 'Toggle comment' })

-- <leader>l to open Lazy
map('n', '<leader>l', '<cmd>Lazy<CR>', { desc = 'Lazy' })

-- open floating terminal
map({ 'n', 't' }, '<leader>ft', '<cmd>Floaterminal<CR>', { desc = 'Toggle floating terminal' })

-- copy all
map('n', '<C-c>', 'gg"+yG', { desc = 'Copy [A]ll to system clipboard' })

map('n', '<leader>x', '<cmd>bd<CR>', { desc = 'Close current buffer' })

-- kickstart stuff
-- Diagnostic keymaps
vim.keymap.set('n', '<leader>qq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set({ 'n', 't' }, '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set({ 'n', 't' }, '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set({ 'n', 't' }, '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set({ 'n', 't' }, '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
vim.keymap.set('n', '<C-S-h>', '<C-w>H', { desc = 'Move window to the left' })
vim.keymap.set('n', '<C-S-l>', '<C-w>L', { desc = 'Move window to the right' })
vim.keymap.set('n', '<C-S-j>', '<C-w>J', { desc = 'Move window to the lower' })
vim.keymap.set('n', '<C-S-k>', '<C-w>K', { desc = 'Move window to the upper' })
