return {
  'jbyuki/nabla.nvim',
  cond = not vim.g.vscode,
  lazy = true,

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
