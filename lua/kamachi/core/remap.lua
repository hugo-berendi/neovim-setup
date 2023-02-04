vim.g.mapleader = ' '

----------------------------------------------
-- ESSENTIAL REMAP
----------------------------------------------
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

----------------------------------------------
-- PLUGIN REMAP
----------------------------------------------
vim.keymap.set('n', '<leader>q', vim.cmd.NvimTreeToggle)
vim.keymap.set('n', '<leader>w', vim.cmd.NvimTreeFocus)
