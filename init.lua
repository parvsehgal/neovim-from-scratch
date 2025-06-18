vim.g.mapleader = " "
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
vim.opt.swapfile = false
vim.wo.relativenumber = true

-- Save file with Ctrl + S in all modes
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-s>', '<Esc>:w<CR><Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-s>', ':w<CR>', { noremap = true, silent = true })
-- to switch from neotree to my files
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>w', { noremap = true, silent = true })
-- to switch between different file buffers
vim.api.nvim_set_keymap('n','<S-l>',':bnext<CR>' ,{noremap=true,silent=true})
vim.api.nvim_set_keymap('n','<S-h>',':bprevious<CR>' ,{noremap=true,silent=true})
-- to close a file buffer
  -- not ideal want to fix in the future
vim.api.nvim_set_keymap('n', '<leader>bd', ':b# | bd #<CR>', { noremap = true, silent = true })
--command to resize buffers
vim.api.nvim_set_keymap('n','<C-right>',':vertical resize +2<CR>',{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<C-left>',':vertical resize -2<CR>',{ noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-Up>', ':resize +2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize -2<CR>', { noremap = true, silent = true })
vim.opt.clipboard = "unnamedplus"
-- to have persistent undo
vim.opt.undofile = true       -- Turn on persistent undo
vim.opt.undodir = vim.fn.stdpath('config') .. '/undo'  -- Set the undo directory
--fold settings
vim.opt.foldmethod = "indent"
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99 -- Open all folds by default
vim.opt.foldminlines = 1    -- Ensures even small indents fold

