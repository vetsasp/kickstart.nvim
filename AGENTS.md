# AGENTS.md - Neovim Configuration Guidelines

This is a Neovim configuration based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim), using lazy.nvim as the plugin manager.

## Build/Lint/Test Commands

This is a Neovim configuration repository, not a software project with traditional tests. However, there are some validation commands available:

### Formatting (Lua)
```bash
# Format Lua files using stylua
stylua --check lua/              # Check formatting without modifying
stylua lua/                       # Format all Lua files
```

Or use Neovim built-in:
```vim
:lua require("conform").format()  " Format current buffer
:ConformInfo                       " Show conform configuration
```

### Plugin Management
```vim
:Lazy                              " Open lazy.nvim UI
:Lazy sync                         " Sync plugins
:Lazy check                        " Check for plugin updates
```

### LSP and Diagnostics
```vim
:Mason                             " Open Mason UI (LSP installer)
:LspInfo                           " Show LSP status
:checkhealth                       " Run Neovim health checks
```

### Single File Testing
There are no unit tests. To test changes:
1. Restart Neovim with `nvim --clean` to test with default settings
2. Or use `:source %` to reload the current file in an active Neovim session

---

## Code Style Guidelines

### General Principles
- This is a Neovim Lua configuration - follow existing patterns in the codebase
- Keep configurations minimal and functional
- Prefer clarity over cleverness

### Formatting Rules (per `.stylua.toml`)
- **Column width**: 160 characters
- **Indentation**: 2 spaces (not tabs)
- **Line endings**: Unix
- **Quotes**: AutoPreferSingle (favor single quotes)
- **Call parentheses**: None (no parentheses for calls with no args)

### File Structure
```
lua/
├── config/           -- Core configuration files
│   ├── options.lua   -- Neovim options
│   ├── keymaps.lua  -- Keybindings
│   ├── autocommands.lua
│   └── theme.lua
├── plugins/          -- Plugin configurations (one file per plugin)
└── kickstart/       -- Original kickstart files (reference)
```

### Imports
- Use `require 'module.path'` (single quotes)
- Use relative requires within the same module structure
- Example: `local map = vim.keymap.set`

### Naming Conventions
- **Files**: snake_case (e.g., `lsp.lua`, `keymaps.lua`)
- **Variables**: snake_case (e.g., `local map`, `local function client_supports_method`)
- **Tables/Modules**: snake_case
- **Constants**: UPPER_SNAKE_CASE (e.g., `vim.diagnostic.severity.ERROR`)

### Lua-Specific Patterns

#### Plugin Configuration
Return a table with the plugin spec:
```lua
return {
  'owner/plugin-name',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = { 'other/plugin' },
  config = function()
    -- configuration code
  end,
}
```

#### Keymaps
Use `vim.keymap.set` with descriptive descriptions:
```lua
local map = vim.keymap.set
map('n', '<leader>xx', function()
  -- code
end, { desc = 'Description of action' })
```

#### LSP Attach Handlers
Follow the pattern in `lua/plugins/lsp.lua`:
- Use `vim.api.nvim_create_autocmd('LspAttach', ...)`
- Create helper functions inside the callback
- Use type annotations with `---@param` for clarity

### Error Handling
- Use `vim.schedule` for operations that might block startup
- Use `pcall` when loading optional plugins that might fail
- Keep error messages concise and actionable

### Options
- Use `vim.opt` for buffer-local options
- Use `vim.o` for global options
- Keep options organized by feature in `lua/config/options.lua`

### Comments
- Use double-dash comments: `-- Comment`
- Use block comments for section headers in init files: `-- [[ Section Name ]]`
- Avoid redundant comments (e.g., `-- Set variable`)

---

## Common Development Tasks

### Adding a New Plugin
1. Create `lua/plugins/<plugin-name>.lua`
2. Return a plugin spec table
3. Restart Neovim or run `:Lazy sync`

### Adding a New Keymap
1. Edit `lua/config/keymaps.lua`
2. Use the `map` function with a description
3. Consider mode (n, i, v, t) and buffer-local options

### Modifying LSP Servers
1. Edit `lua/plugins/lsp.lua`
2. Add/remove servers in the `servers` table
3. Run `:LspRestart` or restart Neovim

### Modifying Formatters
1. Edit `lua/plugins/conform.lua`
2. Add formatters to `formatters_by_ft`
3. Install formatters via Mason if needed

---

## References
- [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [stylua](https://github.com/astral-sh/stylua)
