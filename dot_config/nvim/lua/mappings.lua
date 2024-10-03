require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "i" }, "<C-z>", ":undo <CR>", { desc = "GENERAL Undo" })
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map({ "n" }, "<C-h>", "<cmd> TmuxNavigateLeft<CR>")
map({ "n" }, "<C-l>", "<cmd> TmuxNavigateRight<CR>")
map({ "n" }, "<C-j>", "<cmd> TmuxNavigateDown<CR>")
map({ "n" }, "<C-k>", "<cmd> TmuxNavigateUp<CR>")

map({ "n" }, "<leader>db", "<cmd> DapToggleBreakpoint <CR>")

map({ "n" }, "<leader>dpr", function()
  require("dap-python").test_method()
end)

map({ "n" }, "<F6>", "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })

map({ "n" }, "<S-F7>", "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })
