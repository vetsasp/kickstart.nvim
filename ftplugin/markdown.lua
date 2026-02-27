vim.keymap.set('n', '<C-b>', 'ciw**<C-r>"**<Esc>', { buffer = true, desc = 'Bold word' })
vim.keymap.set('x', '<C-b>', '"xc**<C-r>x**<Esc>', { buffer = true, desc = 'Bold selection' })
