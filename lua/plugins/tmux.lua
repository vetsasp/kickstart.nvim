-- Seamless navigation between editor splits and the terminal multiplexer.
-- Only the plugin for the multiplexer this Neovim runs inside is loaded, so
-- the same config works in tmux, in tuios, and outside both.
local function in_tmux()
  local tmux = vim.env.TMUX
  return tmux ~= nil and tmux ~= ''
end

local function in_tuios()
  return vim.env.TUIOS_ENV == '1'
end

return {
  {
    'alexghergh/nvim-tmux-navigation',
    -- $TMUX wins if both are set: the innermost multiplexer is tmux when
    -- tmux runs inside a tuios pane.
    cond = function()
      return not vim.g.vscode and in_tmux()
    end,
    config = function()
      require('nvim-tmux-navigation').setup {
        disable_when_zoomed = true, -- defaults to false
        keybindings = {
          left = '<C-h>',
          down = '<C-j>',
          up = '<C-k>',
          right = '<C-l>',
          -- last_active = '<C-\\>',
          -- next = '<C-Space>',
        },
      }
    end,
  },
  {
    'Tim4c/tuios-nvim-navigator',
    cond = function()
      return not vim.g.vscode and not in_tmux() and in_tuios()
    end,
    config = function()
      local nav = require 'tuios-nvim-navigator'
      nav.setup {
        keymaps = {
          left = '<C-h>',
          down = '<C-j>',
          up = '<C-k>',
          right = '<C-l>',
        },
      }

      -- tuios also binds alt+arrows to the same terminal_focus_* actions.
      -- Map them here too so they still hand off from inside Neovim.
      for dir, lhs in pairs {
        left = '<A-Left>',
        down = '<A-Down>',
        up = '<A-Up>',
        right = '<A-Right>',
      } do
        vim.keymap.set('n', lhs, function()
          nav.navigate(dir)
        end, { silent = true, desc = 'Navigate ' .. dir .. ' through tuios' })
      end
    end,
  },
}
