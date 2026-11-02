# Neovim config

Personal Neovim configuration based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim), using [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager.

## Requirements

- Neovim 0.12+
- `git`, `make`, `unzip`, `rg`
- A Nerd Font (icons are enabled in `lua/config/options.lua`)

## Layout

```
init.lua               entry point
lua/config/            options, keymaps, autocommands, theme, VS Code shims
lua/plugins/           plugin specs (one file per plugin or feature)
lua/kickstart/         upstream kickstart reference files (not all are loaded)
ftplugin/              filetype-specific settings
spell/                 personal spellfile
```

## Common commands

```vim
:Lazy             " plugin manager
:Mason            " LSP/formatter installer
:checkhealth      " health checks
:LspInfo          " active language servers
```

Format Lua with `stylua lua/ ftplugin/`.
