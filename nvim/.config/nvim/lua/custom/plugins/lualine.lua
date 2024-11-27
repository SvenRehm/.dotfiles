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
local function last_three_dirs()
  local full_path = vim.fn.expand '%:p:h' -- Get the directory of the current file
  local parts = vim.split(full_path, '/') -- Split the path by '/'

  -- Get the last three directory names
  local dir_count = #parts
  local last_three = {}

  -- Add the last three directories to the table
  for i = dir_count - 2, dir_count do
    if i >= 1 then -- Ensure we don't go to index 0
      table.insert(last_three, parts[i])
    end
  end

  return table.concat(last_three, '/') .. '/' .. vim.fn.expand '%:t' -- Append filename
end

local function last_two_dirs()
  local full_path = vim.fn.expand '%:p:h' -- Get the directory of the current file
  local parts = vim.split(full_path, '/') -- Split the path by '/'

  -- Get the last two directory names
  local dir_count = #parts
  local last_two = {}

  if dir_count >= 2 then
    table.insert(last_two, parts[dir_count - 1]) -- Last directory
    table.insert(last_two, parts[dir_count]) -- Current directory
  elseif dir_count == 1 then
    table.insert(last_two, parts[1]) -- Only one directory available
  end

  return table.concat(last_two, '/') .. '/' .. vim.fn.expand '%:t' -- Append filename
end

local function full_path()
  return vim.fn.expand '%:p' -- Get the full path of the current file
end

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
          -- lualine_c = { 'filename' },
          -- lualine_c = { last_two_dirs },
          lualine_c = { last_three_dirs },
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
