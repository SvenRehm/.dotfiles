local colorbuddy = require 'colorbuddy'
local Color = colorbuddy.Color
local colors = colorbuddy.colors
local Group = colorbuddy.Group
local groups = colorbuddy.groups
local styles = colorbuddy.styles

colorbuddy.colorscheme 'nani'
-- Color.new('primary', '#2d75eb')
-- Color.new('secondary', '#2d75eb')
Color.new('text', '#2d75eb')
-- Color.new('nani', '#000000')
-- Color.new('function', '#000814')

Group.new('CursorLineNr', colors.primary, colors.background)
Group.new('String', colors.primary, colors.background)
-- Group.new('Normal', colors.noir_4, colors.background)
-- Group.new('Normal', colors.background, colors.background)
-- Group.new('Search', colors.noir_9, colors.noir_0)
-- Group.new('IncSearch', colors.noir_9, colors.noir_0)
--
-- Group.new('Visual', nil, colors.primary)
-- Group.new('Visual', nil, colors.nani)
-- Group.new('SignColumn', nil, colors.background)
-- Group.new('LineNr', colors.noir_8, colors.background)
-- Group.new('EndOfBuffer', colors.noir_8, nil)

-- telescope custom config
require('catppuccin').setup {}
local cat = require('catppuccin.palettes').get_palette()
local TelescopeColor = {
  TelescopeMatching = { fg = cat.flamingo },
  TelescopeSelection = { fg = cat.text, bg = cat.surface0, bold = true },

  TelescopePromptPrefix = { bg = cat.surface0 },
  TelescopePromptNormal = { bg = cat.surface0 },
  TelescopeResultsNormal = { bg = cat.mantle },
  TelescopePreviewNormal = { bg = cat.mantle },
  TelescopePromptBorder = { bg = cat.surface0, fg = cat.surface0 },
  TelescopeResultsBorder = { bg = cat.mantle, fg = cat.mantle },
  TelescopePreviewBorder = { bg = cat.mantle, fg = cat.mantle },
  TelescopePromptTitle = { bg = cat.pink, fg = cat.mantle },
  TelescopeResultsTitle = { fg = cat.mantle },
  TelescopePreviewTitle = { bg = cat.green, fg = cat.mantle },
}

for hl, col in pairs(TelescopeColor) do
  vim.api.nvim_set_hl(0, hl, col)
end
-- vim.cmd.colorscheme 'catppuccin-macchiato'
