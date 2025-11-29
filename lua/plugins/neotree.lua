-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },

  keys = {
    {
      '<leader>e',
      ':Neotree toggle reveal<CR>',
      desc = 'NeoTree',
      silent = true,
    },
  },

  opts = {
    close_if_last_window = true,
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_git_ignored = true,
        hide_hidden = true,
      },
      filtering = {
        window = {
          position = 'top',
          label = 'Explore: ',
        },
        case_sensitive = false,
        search_while_typing = true,
      },
      window = {
        position = 'left',
        mappings = {
          -- Your overrides
          ['l'] = 'open', -- open file / expand directory
          ['h'] = 'close_node', -- collapse directory
          ['H'] = 'navigate_up', -- go to parent directory
          ['<leader>e'] = 'close_window',
        },
      },
    },
  },
}
