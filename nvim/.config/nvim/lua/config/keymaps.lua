-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>gs", ":Neogit<CR>", { desc = "Open Neogit" })

--harpoon
vim.keymap.del("n", "<leader>l")
local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<leader>a", function()
  harpoon:list():add()
end)
vim.keymap.set("n", "<leader>l", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<leader>n", function()
  harpoon:list():select(1)
end)
vim.keymap.set("n", "<leader>e", function()
  harpoon:list():select(2)
end)
vim.keymap.set("n", "<leader>i", function()
  harpoon:list():select(3)
end)
vim.keymap.set("n", "<leader>o", function()
  harpoon:list():select(4)
end)
