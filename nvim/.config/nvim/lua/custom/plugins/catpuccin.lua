return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,

  config = function()
    require('catppuccin').setup {
      color_overrides = {
        mocha = {
          base = '#101010',
        },
      },
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
          enabled = true,
          indentscope_color = '',
        },
        telescope = {
          enabled = true,
          style = 'nvchad',
        },
      },
    }
    vim.cmd.colorscheme 'catppuccin'
  end,
}
