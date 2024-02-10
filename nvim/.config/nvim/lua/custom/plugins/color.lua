return {
  -- 'SvenRehm/njem.nvim',
  -- config = function()
  --   vim.cmd [[colorscheme tokyonight-njem]]
  -- end,
  'jesseleite/nvim-noirbuddy',
  dependencies = {
    { 'tjdevries/colorbuddy.nvim', branch = 'dev' }
  },
  lazy = false,
  priority = 1000,
  opts = {
    preset = 'miami-nights',
  },
}