-- return {}
-- local colors = {
--   blue = '#80a0ff',
--   cyan = '#79dac8',
--   black = '#080808',
--   white = '#c6c6c6',
--   red = '#ff5189',
--   violet = '#d183e8',
--   grey = '#303030',
-- }
--
-- local bubbles_theme = {
--   normal = {
--     a = { fg = colors.black, bg = colors.violet },
--     b = { fg = colors.white, bg = colors.grey },
--     c = { fg = colors.white },
--   },
--
--   insert = { a = { fg = colors.black, bg = colors.blue } },
--   visual = { a = { fg = colors.black, bg = colors.cyan } },
--   replace = { a = { fg = colors.black, bg = colors.red } },
--
--   inactive = {
--     a = { fg = colors.white, bg = colors.black },
--     b = { fg = colors.white, bg = colors.black },
--     c = { fg = colors.white },
--   },
-- }

return {

  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  opts = function()
    return {

      require('lualine').setup {
        options = {
          icons_enabled = true,
          disabled_filetypes = {},
          section_separators = {},
          component_separators = {},
          always_divide_middle = true,
          globalstatus = false,
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch' },
          lualine_c = { 'filename' },
          lualine_x = { 'diagnostics', 'diff', 'filetype' },
          lualine_y = { 'location' },
          lualine_z = { 'progress' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = {},
      },
    }
  end,
}
