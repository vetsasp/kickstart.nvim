--[[

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

-- ]]

-- [[ options ]]
require 'config.options'

-- [[ Keymaps ]]
require 'config.keymaps'

-- [[ Autocommands ]]
require 'config.autocommands'

-- [[ Configure and install plugins ]]
require('lazy').setup({
  spec = {
    { import = 'plugins' },
  },

  -- -- individual imports for bugfix
  -- require 'plugins.blink',
  -- require 'plugins.conform',
  -- require 'plugins.copilot',
  -- require 'plugins.flash',
  -- require 'plugins.gitsigns',
  -- require 'plugins.init',
  -- require 'plugins.lsp',
  -- require 'plugins.mini',
  -- require 'plugins.neotree',
  -- require 'plugins.obsidian',
  -- require 'plugins.snacks',
  -- require 'plugins.telescope',
  -- require 'plugins.todo',
  -- require 'plugins.tokyonights',
  -- require 'plugins.treesitter',
  -- require 'plugins.trouble',
  -- require 'plugins.whichkey',

  install = { colorscheme = { 'tokyonight' } },
  checker = { enabled = true },

  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
