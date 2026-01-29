local banner = [[
  ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
  ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z
  ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z
  ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z
  ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
  ]]

return {
  'folke/snacks.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    terminal = {
      colorize = true,
    },
    dashboard = {
      enabled = true,
      float = false,
      close_on_action = true,
      preset = {
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
          { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
          { icon = ' ', key = 'g', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = ' ', key = 't', desc = 'Todo Comments', action = ":lua Snacks.dashboard.pick('todo_comments')" },
          { icon = ' ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = ' ', key = 'c', desc = 'Config', action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = ' ', key = 's', desc = 'Restore Session', section = 'session' },
          { icon = '󰒲 ', key = 'l', desc = 'Lazy', action = ':Lazy' },
          { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
        },
        -- header = banner,
      },
      sections = {
        { section = 'header', padding = 2 },
        { section = 'keys', gap = 1, padding = 1 },
        { section = 'startup' },
      },
    },
    indent = {},
    notifier = {},
    scratch = {},
  },
  keys = {
    {
      '<leader>.',
      function()
        Snacks.scratch()
      end,
      desc = 'Toggle Scratch Buffer',
    },
  },
  config = function(_, opts)
    local Snacks = require 'snacks'
    Snacks.setup(opts)

    vim.keymap.set({ 'n', 't' }, '<leader>t', function()
      Snacks.terminal()
    end, { desc = 'Toggle Snacks Terminal' })

    vim.keymap.set('t', '<C-k>', function()
      vim.cmd 'wincmd k'
    end, { desc = 'Go to buffer above (Snacks Terminal)' })
  end,
}
