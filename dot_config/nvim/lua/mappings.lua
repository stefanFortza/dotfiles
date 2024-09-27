require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "i" }, "<C-z>", ":undo <CR>", { desc = "GENERAL Undo" })
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map({ "n" }, "<C-h>", "<cmd> TmuxNavigateLeft<CR>")
map({ "n" }, "<C-l>", "<cmd> TmuxNavigateRight<CR>")
map({ "n" }, "<C-j>", "<cmd> TmuxNavigateDown<CR>")
map({ "n" }, "<C-k>", "<cmd> TmuxNavigateUp<CR>")
