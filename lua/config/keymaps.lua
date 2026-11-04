local map = vim.keymap.set

----- ESSENTIALS -----
map('n', ';', ':', { desc = 'CMD enter command mode' })
-- Better escape from insert mode. Do not map this in visual mode: selecting
-- downward then upward would trigger it accidentally.
map('i', 'jk', '<ESC>')

----- NAVIGATION -----
-- Start and End of lines
map({ 'n', 'v' }, '<S-H>', '^', { desc = 'Move to first non-space character' })
-- map({ 'n', 'v' }, '<S-L>', 'g_', { desc = 'Move to last non-space character' })
map({ 'n', 'v' }, '<S-L>', '$', { desc = 'Move to last character' })

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

-- Oil
map('n', '<leader>o', '<cmd>Oil<CR>', { desc = 'Oil' })
map('n', '<leader>O', '<cmd>vsp<CR><cmd>Oil<CR>', { desc = 'Oil (vertical split)' })

----- IMPROVEMENTS -----
-- Searches centered
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- paste without yanking
map('x', '<leader>p', '"_dP')

-- <leader>l to open Lazy
map('n', '<leader>lz', '<cmd>Lazy<CR>', { desc = 'Lazy' })

-- copy all
map('n', '<C-c>', 'gg"+yG', { desc = 'Copy [A]ll to system clipboard' })

-- close current buffer
map('n', '<leader>x', '<cmd>bd<CR>', { desc = 'Close current buffer' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- vim.keymap.del('n', '<leader>th')
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Toggle line comment
map({ 'n', 'v' }, '<leader>/', function()
  vim.cmd 'normal gcc'
end, { desc = 'Toggle comment' })

----- QUICKFIX -----
-- Navigate the quickfix/location list, wrapping at the ends.
local function qf_nav(direction)
  local winid = vim.api.nvim_get_current_win()
  local is_loclist = vim.fn.getwininfo(winid)[1].loclist == 1
  local info = is_loclist and vim.fn.getloclist(0, { idx = 0, size = 0 }) or vim.fn.getqflist { idx = 0, size = 0 }
  if info.size == 0 then
    return
  end

  -- With no current entry, next starts at the first item and prev at the last.
  local base = info.idx
  if base == 0 then
    base = direction > 0 and 0 or 1
  end
  local target = (base - 1 + direction) % info.size + 1
  vim.cmd(('%s %d'):format(is_loclist and 'll' or 'cc', target))
end

-- Wrap `n`/`p` inside the quickfix window itself.
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('qf-wrap-nav', { clear = true }),
  pattern = 'qf',
  callback = function(args)
    vim.keymap.set('n', 'n', function()
      qf_nav(1)
    end, { buffer = args.buf, desc = 'Next quickfix item (wrap)' })
    vim.keymap.set('n', 'p', function()
      qf_nav(-1)
    end, { buffer = args.buf, desc = 'Previous quickfix item (wrap)' })
  end,
})

map('n', '<leader>qd', function()
  vim.diagnostic.setqflist()
  vim.cmd 'copen'
end, { desc = 'Open [D]iagnostic quickfix list' })
map('n', '<leader>qn', function()
  qf_nav(1)
end, { desc = 'Go to [N]ext quickfix item (wrap)' })
map('n', '<leader>qp', function()
  qf_nav(-1)
end, { desc = 'Go to [P]revious quickfix item (wrap)' })
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

-- Show notification telescope, if there are any
map('n', '<leader>fn', function()
  require('snacks').picker.notifications()
end, { desc = 'Show snack notifications' })
