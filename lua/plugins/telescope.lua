return { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  keys = {
    {
      '<leader><leader>',
      function()
        require('telescope.builtin').buffers()
      end,
      desc = '[ ] Find existing buffers',
    },
    {
      '<leader>ff',
      function()
        require('telescope.builtin').find_files()
      end,
      desc = '[F]ind [F]iles',
    },
    {
      '<leader>fh',
      function()
        require('telescope.builtin').help_tags()
      end,
      desc = '[F]ind [H]elp',
    },
    {
      '<leader>fk',
      function()
        require('telescope.builtin').keymaps()
      end,
      desc = '[F]ind [K]eymaps',
    },
    {
      '<leader>fT',
      function()
        require('telescope.builtin').builtin()
      end,
      desc = '[F]ind [T]elescope',
    },
    {
      '<leader>fw',
      function()
        require('telescope.builtin').grep_string()
      end,
      desc = '[F]ind [W]ord',
    },
    {
      '<leader>fg',
      function()
        require('telescope.builtin').live_grep()
      end,
      desc = '[F]ind by [G]rep',
    },
    {
      '<leader>fd',
      function()
        require('telescope.builtin').diagnostics()
      end,
      desc = '[F]ind [D]iagnostics',
    },
    {
      '<leader>fr',
      function()
        require('telescope.builtin').resume()
      end,
      desc = '[F]ind [R]esume',
    },
    {
      '<leader>f.',
      function()
        require('telescope.builtin').oldfiles()
      end,
      desc = '[F]ind Recent Files ("." for repeat)',
    },
    {
      '<leader>fb',
      function()
        require('telescope.builtin').buffers()
      end,
      desc = '[F]ind [B]uffers',
    },
    {
      '<leader>fz',
      function()
        local builtin = require 'telescope.builtin'
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end,
      desc = '[/] Fuzzily search in current buffer',
    },
    {
      '<leader>f/',
      function()
        local builtin = require 'telescope.builtin'
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end,
      desc = '[F]ind [/] in Open Files',
    },
    {
      '<leader>fc',
      function()
        local builtin = require 'telescope.builtin'
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end,
      desc = '[F]ind Neovim [C]onfig files',
    },
    {
      '<leader>ft',
      function()
        vim.cmd 'TodoTelescope'
      end,
      desc = '[F]ind [t]odos',
    },
  },
  config = function()
    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['<C-a>'] = require('telescope.actions').smart_send_to_qflist,
          },
          n = {
            ['<C-a>'] = require('telescope.actions').smart_send_to_qflist,
          },
        },
      },
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

    -- require('config.multigrep').setup()
  end,
}
