return {
  'MeanderingProgrammer/render-markdown.nvim',
  enabled = false,
  cond = not vim.g.vscode,
  ft = { 'markdown' },
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    completions = { lsp = { enabled = true } },
    render_modes = true,
  },
}
