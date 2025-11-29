return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},
  setup = function()
    require('render-markdown').setup {
      completions = { lsp = { enabled = true } },
      render_modes = true,
    }
  end,
}
