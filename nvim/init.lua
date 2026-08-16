require("config.lazy")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- ヤンク・削除・ペーストでシステムのクリップボードを利用する
vim.opt.clipboard = "unnamedplus"

-- 常に行番号を表示する
vim.opt.number = true

local function copy_current_file_path()
  local path = vim.fn.expand "%:."
  vim.fn.setreg("*", path)
  vim.api.nvim_echo({ { "Copied: " .. path, "None" } }, true, {})
end
vim.keymap.set("n", "<Leader>yp", copy_current_file_path, { noremap = true, silent = true })

