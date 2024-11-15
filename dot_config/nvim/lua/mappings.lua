require "nvchad.mappings"

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "i" }, "<C-z>", ":undo <CR>", { desc = "GENERAL Undo" })
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map({ "n" }, "<C-h>", "<cmd> TmuxNavigateLeft<CR>")
map({ "n" }, "<C-l>", "<cmd> TmuxNavigateRight<CR>")
map({ "n" }, "<C-j>", "<cmd> TmuxNavigateDown<CR>")
map({ "n" }, "<C-k>", "<cmd> TmuxNavigateUp<CR>")

-- Nvim DAP
map("n", "<Leader>dl", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
map("n", "<Leader>dj", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
map("n", "<Leader>dk", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
map("n", "<Leader>d<space>", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue" })
map("n", "<Leader>d<space>", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Debugger toggle breakpoint" })
map(
  "n",
  "<Leader>dd",
  "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  { desc = "Debugger set conditional breakpoint" }
)
map("n", "<Leader>de", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger reset" })
map("n", "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debugger run last" })

map({ "n" }, "<leader>dpr", function()
  require("dap-python").test_method()
end)

map({ "n" }, "<F6>", "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })

map({ "n" }, "<S-F7>", "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })

map({ "n" }, "<leader>rh", "<cmd>!runghc %<cr>", { noremap = true, silent = true })
map({ "n" }, "<leader>rd", "<cmd>!dotnet run <cr>", { noremap = true, silent = true })

map({ "n" }, "<leader><leader>", "<cmd>RunCode <cr>", { noremap = true, silent = true })
