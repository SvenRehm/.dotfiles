return {
  "aktersnurra/no-clown-fiesta.nvim",
  dependencies = {
    { "tjdevries/colorbuddy.nvim" },
  },
  config = function()
    require("no-clown-fiesta").setup({
      transparent = true, -- Enable this to disable the bg color
      styles = {
        -- You can set any of the style values specified for `:h nvim_set_hl`
        comments = {},
        functions = {},
        keywords = {},
        lsp = { underline = true },
        match_paren = {},
        type = { bold = true },
        variables = {},
      },
    })

    vim.cmd.colorscheme("no-clown-fiesta")

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
