
local opt = vim.opt

opt.expandtab = true
opt.smarttab = true
opt.shiftwidth = 4
opt.tabstop = 4

opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.splitbelow = true
opt.splitright = true
opt.wrap = false
opt.scrolloff = 5
opt.fileencoding = 'utf-8'
opt.termguicolors = true

opt.relativenumber = true
opt.cursorline = true

vim.g.catppuccin_flavour = "mocha"
require("catppuccin").setup()
vim.cmd "colorscheme catppuccin"
