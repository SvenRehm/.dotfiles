return {
  'echasnovski/mini.indentscope',
  version = '*',
  config = function()
    require('mini.indentscope').setup {
      draw = {
        delay = 0,
        animation = require('mini.indentscope').gen_animation.none(),
        priority = 0,
      },
      options = {
        try_as_border = false,
      },
      symbol = '│',
    }
  end,
}
