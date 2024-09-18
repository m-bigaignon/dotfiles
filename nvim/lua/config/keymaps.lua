-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps hereby
--
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Idr what any of thesethese do
keymap.set("n", "J", "mzJ`z")
keymap.set("v", "J", ":m '>+2<CR>gv=gv")
keymap.set("v", "K", ":m '<-1<CR>gv=gv")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Deletes a work backwards
keymap.set("n", "dw", "vb_d")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Increment / decrement
-- keymap.set("n", "+", "<C-a>")
-- keymap.set("n", "-", "<C-x>")

--- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", "tabedit", opts)
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Window management
keymap.set("n", "<leader>wh", ":split<Return>", { noremap = true, silent = true, desc = "Horizontal split" })
keymap.set("n", "<leader>wv", ":vsplit<Return>", { noremap = true, silent = true, desc = "Vertical split" })

-- Quick scrolling
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- Shortcut to yank current line
keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank current" })

-- Remap Ctrl-C to have the same behavior as Esc
keymap.set("i", "<C-c>", "<Esc>")
