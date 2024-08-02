-- return {
-- 'SvenRehm/njem.nvim',
-- config = function()
--   vim.cmd [[colorscheme tokyonight-njem]]
-- end,
--   'jesseleite/nvim-noirbuddy',
--   dependencies = {
--     { 'tjdevries/colorbuddy.nvim', branch = 'dev' },
--   },
--   lazy = false,
--   priority = 1000,
--   opts = {
--     preset = 'miami-nights',
--   },
-- }
return {
  {
    'folke/tokyonight.nvim',
    -- priority = 1000,
    -- init = function()
    --   vim.cmd.colorscheme 'tokyonight-storm'
    -- end,
    opts = {
      terminal_colors = true,
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
        functions = {},
        variables = {},
        sidebars = 'dark', -- style for sidebars, see below
        floats = 'dark', -- style for floating windows
      },
      on_colors = function(colors)
        colors.bg = '#101010'
      end,
    },
  },
  {
    'ramojus/mellifluous.nvim',
    -- priority = 1000,
    -- version = "v0.*", -- uncomment for stable config (some features might be missed if/when v1 comes out)
    config = function()
      require('mellifluous').setup {
        mellifluous = {
          dark = {
            main_keywords = '#e0e066',
          },
        },
      } -- optional, see configuration section.

      -- vim.cmd 'colorscheme mellifluous'
    end,
  },
  {
    'aktersnurra/no-clown-fiesta.nvim',
    config = function()
      require('no-clown-fiesta').setup {
        transparent = false, -- Enable this to disable the bg color
        styles = {
          comments = {},
          functions = {},
          keywords = {},
          lsp = {},
          match_paren = {},
          type = { bold = true },
          variables = {},
        },
      }
      vim.cmd [[colorscheme no-clown-fiesta]]
    end,
  },
}
