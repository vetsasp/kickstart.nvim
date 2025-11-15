return {
  "zbirenbaum/copilot.lua",
  requires = {
    "copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality
  },
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      panel = {
        auto_refresh = true,
        keymap = {},
      },
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<leader><Tab>",
        },
      },
    })
  end,
}
