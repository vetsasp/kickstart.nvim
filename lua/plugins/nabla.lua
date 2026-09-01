return {
  'jbyuki/nabla.nvim',
  opts = { ensure_installed = { 'tree-sitter-cli' } },
  lazy = true,
  -- enabled = false,

  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = { 'latex' },
      auto_install = true,
      sync_install = false,
    }
  end,

  keys = function()
    return {
      {
        '<leader>p',
        ':lua require("nabla").popup()<cr>',
        desc = 'NablaPopUp',
      },
    }
  end,
}
