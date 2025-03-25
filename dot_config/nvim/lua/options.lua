require "nvchad.options"

-- add yours here!
-- vim.g.NERDTreeShowHidden = 1

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!
o.clipboard = "unnamedplus"
o.relativenumber = true

-- if vim.fn.has "wsl" == 1 then
--   vim.g.clipboard = {
--     name = "WslClipboard",
--     copy = {
--       ["+"] = "clip.exe",
--       ["*"] = "clip.exe",
--     },
--     paste = {
--       ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--       ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--     },
--     cache_enabled = 0,
--   }
-- end
--
-- vim.g.clipboard = {
--   name = "clip.exe",
--   copy = {
--     ["+"] = "clip.exe",
--     ["*"] = "clip.exe",
--   },
--   paste = {
--     ["+"] = "powershell.exe -c Get-Clipboard",
--     ["*"] = "powershell.exe -c Get-Clipboard",
--   },
-- }
