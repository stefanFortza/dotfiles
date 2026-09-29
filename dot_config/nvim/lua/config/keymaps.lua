-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Modificări rapide & Undo
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })
map({ "n", "i" }, "<C-z>", "<cmd>undo<cr>", { desc = "Undo" })
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr>", { desc = "Save file" })

-- Tmux navigation
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Navigate Tmux Left" })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Navigate Tmux Right" })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Navigate Tmux Down" })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Navigate Tmux Up" })

-- Nvim-DAP (Debug)
map("n", "<Leader>dl", function()
  require("dap").step_into()
end, { desc = "DAP: Step Into" })
map("n", "<Leader>dj", function()
  require("dap").step_over()
end, { desc = "DAP: Step Over" })
map("n", "<Leader>dk", function()
  require("dap").step_out()
end, { desc = "DAP: Step Out" })
map("n", "<Leader>dc", function()
  require("dap").continue()
end, { desc = "DAP: Continue" })
map("n", "<Leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "DAP: Toggle Breakpoint" })
map("n", "<Leader>dd", function()
  require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "DAP: Set Conditional Breakpoint" })
map("n", "<Leader>de", function()
  require("dap").terminate()
end, { desc = "DAP: Terminate" })
map("n", "<Leader>dr", function()
  require("dap").run_last()
end, { desc = "DAP: Run Last" })

-- DAP Python
map("n", "<Leader>dpr", function()
  require("dap-python").test_method()
end, { desc = "DAP Python: Test Method" })

-- Compiler.nvim
map("n", "<F6>", "<cmd>CompilerOpen<cr>", { noremap = true, silent = true, desc = "Compiler: Open" })
map(
  "n",
  "<S-F7>",
  "<cmd>CompilerToggleResults<cr>",
  { noremap = true, silent = true, desc = "Compiler: Toggle Results" }
)

-- Runners pentru limbaje
map("n", "<leader>rh", "<cmd>!runghc %<cr>", { noremap = true, silent = true, desc = "Run Haskell (runghc)" })
map("n", "<leader>rd", "<cmd>!dotnet run<cr>", { noremap = true, silent = true, desc = "Run .NET project" })
map("n", "<leader><leader>", "<cmd>RunCode<cr>", { noremap = true, silent = true, desc = "Run Code" })
