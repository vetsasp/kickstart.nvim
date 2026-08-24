vim.opt.conceallevel = 2

vim.keymap.set('n', '<C-b>', 'ciw**<C-r>"**<Esc>', { buffer = true, desc = 'Bold word' })
vim.keymap.set('x', '<C-b>', '"xc**<C-r>x**<Esc>', { buffer = true, desc = 'Bold selection' })

vim.opt.spell = true
vim.opt.spelllang = 'en_us'
-- vim.opt.spelloptions = 'camel,cap,digraph,dumb,fake,footnotes,fold,hyphen,ngram'
