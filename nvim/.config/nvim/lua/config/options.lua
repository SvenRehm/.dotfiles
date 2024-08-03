-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
return {
  "LazyVim/LazyVim",
  opts = {
    icons = {
      diagnostics = {
        Error = "    ",
        Warn = " ",
        Hint = " ",
        Info = " ",
      },
    },
  },
  {
    "nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
}
