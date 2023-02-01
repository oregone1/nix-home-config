
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

-- misc
map('n', '<leader>rr', ':source $MYVIMRC<CR>', {noremap=false, silent=true})

-- tree
map('n', '<leader><tab>', ':NvimTreeToggle<CR>', opts)

-- telescope
map('n', '<leader><leader>', ':Telescope find_files<CR>', opts)
map('n', '<leader>b', ':Telescope buffers<CR>', opts)
map('n', '<leader>t', ':Telescope<CR>', opts)

-- split focus
map('n', '<leader>,', ':wincmd k<CR>', opts)
map('n', '<leader>e', ':wincmd l<CR>', opts)
map('n', '<leader>o', ':wincmd j<CR>', opts)
map('n', '<leader>a', ':wincmd h<CR>', opts)
map('n', '<leader>sv', ':vsplit<CR>', opts)
map('n', '<leader>sh', ':split<CR>', opts)
