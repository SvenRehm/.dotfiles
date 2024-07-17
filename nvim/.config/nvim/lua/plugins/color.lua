-- return {
--   { "Hiroya-W/sequoia-moonlight.nvim" },
--   {
--     "LazyVim/LazyVim",
--
--     opts = {
--       colorscheme = "sequoia",
--     },
--   },
-- }

-- return {
--   "catppuccin/nvim",
--   lazy = true,
--   name = "catppuccin",
--   opts = {
--     integrations = {
--       aerial = true,
--       alpha = true,
--       cmp = true,
--       dashboard = true,
--       flash = true,
--       gitsigns = true,
--       headlines = true,
--       illuminate = true,
--       indent_blankline = { enabled = true },
--       leap = true,
--       lsp_trouble = true,
--       mason = true,
--       markdown = true,
--       mini = true,
--       native_lsp = {
--         enabled = true,
--         underlines = {
--           errors = { "undercurl" },
--           hints = { "undercurl" },
--           warnings = { "undercurl" },
--           information = { "undercurl" },
--         },
--       },
--       navic = { enabled = true, custom_bg = "lualine" },
--       neotest = true,
--       neotree = true,
--       noice = true,
--       notify = true,
--       semantic_tokens = true,
--       telescope = true,
--       treesitter = true,
--       treesitter_context = true,
--       which_key = true,
--     },
--   },
--   config = function()
--     vim.cmd.colorscheme("catppuccin")
--   end,
-- }

return {
  "jesseleite/nvim-noirbuddy",
  dependencies = {
    { "tjdevries/colorbuddy.nvim" },
  },
  lazy = false,
  priority = 1000,
  opts = {
    -- All of your `setup(opts)` will go here
  },
  config = function()
    require("noirbuddy").setup({
      preset = "minimal",
      colors = {
        diff_add = "#f5f5f5",
        diff_change = "#737373",
        diff_delete = "#EC0034",
      },
    })

    local colorbuddy = require("colorbuddy")
    local Color = colorbuddy.Color
    local colors2 = colorbuddy.colors
    local Group = colorbuddy.Group
    local groups = colorbuddy.groups
    local styles = colorbuddy.styles
    Group.new("CursorLineNr", colors2.primary, colors2.background)
    Group.new("GitSignsAdd", colors2.diff_add, colors2.background)
    Group.new("GitSignsChange", colors2.diff_change, colors2.background)

    require("catppuccin").setup({})
    local colors = require("catppuccin.palettes").get_palette()

    local TelescopeColor = {
      TelescopeMatching = { fg = colors.flamingo },
      TelescopeSelection = { fg = colors.text, bg = colors.surface0, bold = true },

      TelescopePromptPrefix = { bg = colors.surface0 },
      TelescopePromptNormal = { bg = colors.surface0 },
      TelescopeResultsNormal = { bg = colors.mantle },
      TelescopePreviewNormal = { bg = colors.mantle },
      TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
      TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
      TelescopePreviewBorder = { bg = colors.mantle, fg = colors.mantle },
      TelescopePromptTitle = { bg = colors.pink, fg = colors.mantle },
      TelescopeResultsTitle = { fg = colors.mantle },
      TelescopePreviewTitle = { bg = colors.green, fg = colors.mantle },
    }
    for hl, col in pairs(TelescopeColor) do
      vim.api.nvim_set_hl(0, hl, col)
    end
  end,
}
