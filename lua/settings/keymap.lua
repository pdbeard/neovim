-- keymap.lua

local map = vim.api.nvim_set_keymap

-- map the leader key
map('n', '<Space>', '', {})
vim.g.mapleader = ' '  -- 'vim.g' sets global variables


--------------------
--Telescope
--------------------
map ('n', '<C-P>', '<cmd>Telescope find_files<cr>', {noremap = true})
map ('n', '<C-F>', '<cmd>Telescope live_grep<cr>', {noremap = true})

--------------------
--NvimTree
--------------------
map ('n', '<F7>', ':NvimTreeToggle<cr>', {noremap = true, silent =true})


--------------------
--vim-visual-multi
--------------------
--map ('n', '<C-D>', 'Find Under', {noremap = true})
