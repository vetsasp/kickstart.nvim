return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  -- The `main` branch is the rewrite compatible with Neovim 0.12+. The old
  -- `master` branch is archived and its custom predicates/directives break on
  -- Neovim 0.12's capture API change (captures are now node arrays, so
  -- `match[capture_id]` is a table and `get_node_text` fails with
  -- "attempt to call method 'range' (a nil value)").
  branch = 'main',
  -- nvim-treesitter `main` does not support lazy-loading.
  lazy = false,
  build = ':TSUpdate',
  dependencies = {
    { 'nvim-treesitter/nvim-treesitter-textobjects', branch = 'main' },
    'nvim-treesitter/nvim-treesitter-context',
  },
  config = function()
    -- Install any missing parsers (async; a no-op when already installed).
    require('nvim-treesitter').install {
      'bash',
      'c',
      'diff',
      'html',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'query',
      'vim',
      'vimdoc',
      'python',
    }

    -- `main` no longer enables highlighting/indentation globally, so enable them
    -- per FileType. Highlighting is provided by Neovim; indentation comes from
    -- nvim-treesitter and is only enabled for languages that ship an `indents`
    -- query (otherwise we would clobber the language's default indenting).
    vim.api.nvim_create_autocmd('FileType', {
      callback = function(args)
        local buf = args.buf

        -- Some Neovim runtime ftplugins already start the highlighter.
        if not vim.treesitter.highlighter.active[buf] then
          pcall(vim.treesitter.start, buf)
        end

        local has_parser, parser = pcall(vim.treesitter.get_parser, buf)
        if not has_parser or not parser then
          return
        end
        local has_query, indent_query = pcall(vim.treesitter.query.get, parser:lang(), 'indents')
        if has_query and indent_query then
          vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })

    -- Text objects. On `main` the keymaps are the user's responsibility.
    require('nvim-treesitter-textobjects').setup {
      select = { lookahead = true },
    }
    local function select_textobject(query)
      return function()
        require('nvim-treesitter-textobjects.select').select_textobject(query, 'textobjects')
      end
    end
    vim.keymap.set({ 'x', 'o' }, 'af', select_textobject '@function.outer', { desc = 'Treesitter select function outer' })
    vim.keymap.set({ 'x', 'o' }, 'if', select_textobject '@function.inner', { desc = 'Treesitter select function inner' })
    vim.keymap.set({ 'x', 'o' }, 'ac', select_textobject '@class.outer', { desc = 'Treesitter select class outer' })
    vim.keymap.set({ 'x', 'o' }, 'ic', select_textobject '@class.inner', { desc = 'Treesitter select class inner' })

    require('treesitter-context').setup { max_lines = 3 }
  end,
}
