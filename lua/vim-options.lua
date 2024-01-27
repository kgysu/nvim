vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.g.mapleader = " "
vim.wo.number = true

vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "write/save" })
vim.keymap.set("n", "<S-q>", ":qa<CR>", { desc = "Quit All" })
--vim.keymap.set("n", "q", ":q<CR>", {})
vim.keymap.set("n", "<leader>q", '@q<CR>', { desc = "exec recording" })
-- vim.keymap.set("n", "<leader><C-c>", '"+y', {})
-- vim.keymap.set("n", "<leader><C-v>", '"+p', {})
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "go down and center cursor" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "go up and center cursor" })

vim.keymap.set("n", "n", "nzzzv", { desc = "searching, next val" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "searching, prev val" })

vim.keymap.set("v", "<leader>p", "\"_dP", { desc = "Paste and load back to buffer" })

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "clear search highlighting" })


vim.keymap.set("n", "<S-D>", "yyp", { desc = "duplicate line" })


