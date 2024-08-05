require("config.lazy")

vim.g.lazyvim_prettier_needs_config = true
vim.opt.relativenumber = false

vim.api.nvim_set_hl(0, "FlashMatch", { bg = "none", fg = "white" })
vim.api.nvim_set_hl(0, "FlashLabel", { bg = "none", fg = "red" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("x", "<leader>p", [["_dP]])
