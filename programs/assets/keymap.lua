
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

-- misc
map('n', '<leader>sv', ':source $MYVIMRC<CR>', {noremap=false, silent=true})

-- tree
map('n', '<leader><tab>', ':NvimTreeToggle<CR>', opts)

-- telescope
map('n', '<leader><leader>', ':Telescope find_files<CR>', opts)
map('n', '<leader>b', ':Telescope buffers<CR>', opts)
map('n', '<leader>a', ':Telescope<CR>', opts)
