-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  -- theme = 'monochrome',
  theme = 'mountain',

  -- theme = 'poimandres',
  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.ui = {
  tabufline = {
    enabled = false,
  },

  statusline = {
    enabled = true,
    -- enabled = false,
    -- theme = 'minimal',
    -- separator_style = "default",
    -- order = { "mode", "f", "git", "%=", "lsp_msg", "%=", "lsp", "cwd", "xyz", "abc" },
    --   modules = {
    --     abc = function()
    --       return "hi"
    --     end,
    --
    --     xyz =  "hi",
    --     f = "%F"
    --   }
  },
}

return M
