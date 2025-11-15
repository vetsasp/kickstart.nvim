return { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = 'make',

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  keys = {
    { '<leader>ff', function() require('telescope.builtin').find_files() end, desc = '[F]ind [F]iles' },
    { '<leader>fh', function() require('telescope.builtin').help_tags() end, desc = '[F]ind [H]elp' },
    { '<leader>fk', function() require('telescope.builtin').keymaps() end, desc = '[F]ind [K]eymaps' },
    { '<leader>fT', function() require('telescope.builtin').builtin() end, desc = '[F]ind [T]elescope' },
    { '<leader>fw', function() require('telescope.builtin').grep_string() end, desc = '[F]ind [W]ord' },
    { '<leader>fg', function() require('telescope.builtin').live_grep() end, desc = '[F]ind by [G]rep' },
    { '<leader>fd', function() require('telescope.builtin').diagnostics() end, desc = '[F]ind [D]iagnostics' },
    { '<leader>fr', function() require('telescope.builtin').resume() end, desc = '[F]ind [R]esume' },
    { '<leader>f.', function() require('telescope.builtin').oldfiles() end, desc = '[F]ind Recent Files ("." for repeat)' },
    { '<leader>fb', function() require('telescope.builtin').buffers() end, desc = '[F]ind [B]uffers' },
    { '<leader><leader>', function() require('telescope.builtin').buffers() end, desc = '[ ] Find existing buffers' },
    { '<leader>fz', function()
      local builtin = require 'telescope.builtin'
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, desc = '[/] Fuzzily search in current buffer' },
    { '<leader>f/', function()
      local builtin = require 'telescope.builtin'
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, desc = '[F]ind [/] in Open Files' },
    { '<leader>fn', function()
      local builtin = require 'telescope.builtin'
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, desc = '[F]ind [N]eovim files' },
  },
  config = function()
    require('telescope').setup {
      -- pickers = {}
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
        fzf = {},
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
  end,
}
