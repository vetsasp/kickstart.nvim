return {
  'jbyuki/nabla.nvim',
  cond = not vim.g.vscode,
  opts = { ensure_installed = { 'tree-sitter-cli' } },
  lazy = true,
  -- enabled = false,

  config = function()
    -- nvim-treesitter `main`: install parsers through the module API.
    require('nvim-treesitter').install { 'latex' }
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
