require("kgysu.set")
require("kgysu.remap")
require("kgysu.lazy")

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

local augroup = vim.api.nvim_create_augroup
local GysuGroup = augroup("Gysu", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

-- function R(name)
-- 	require("plenary.reload").reload_module(name)
-- end

-- Highlight when yanking (copying) text
autocmd("TextYankPost", {
  group = yank_group,
  pattern = "*",
  desc = "Highlight when yanking (copying) text",
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Set colorscheme on file-type
autocmd("BufEnter", {
  group = GysuGroup,
  desc = "Set coloscheme based on file type",
  callback = function()
    if vim.bo.filetype == "zig" then
      vim.cmd.colorscheme("gruvbox")
    elseif vim.bo.filetype == "go" or vim.bo.filetype == "nix" then
      vim.cmd.colorscheme("gruvbox")
    -- vim.cmd.colorscheme("tokyonight-night")
    else
      vim.cmd.colorscheme("gruvbox")
    end
  end,
})

-- Configure Terminal
autocmd("TermOpen", {
  group = GysuGroup,
  desc = "Configure terminal",
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})
