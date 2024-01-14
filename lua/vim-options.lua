vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.g.mapleader = " "
vim.wo.number = true

vim.keymap.set("n", "<C-s>", ":w<CR>", {})
vim.keymap.set("n", "<S-q>", ":qa<CR>", {})
vim.keymap.set("n", "<leader>q", '@q<CR>', {})
-- vim.keymap.set("n", "<leader><C-c>", '"+y', {})
-- vim.keymap.set("n", "<leader><C-v>", '"+p', {})

