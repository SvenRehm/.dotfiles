return {
  'theprimeagen/harpoon',
  config = function()
    local mark = require 'harpoon.mark'
    local ui = require 'harpoon.ui'

    vim.keymap.set('n', '<leader>a', mark.add_file, { desc = 'Harpoon add file' })
    vim.keymap.set('n', '<leader>l', ui.toggle_quick_menu, { desc = 'Harpoon menu' })

    vim.keymap.set('n', '<leader>n', function()
      ui.nav_file(1)
    end, { desc = 'Harpoon 1' })
    vim.keymap.set('n', '<leader>e', function()
      ui.nav_file(2)
    end, { desc = 'Harpoon 2' })
    vim.keymap.set('n', '<leader>i', function()
      ui.nav_file(3)
    end, { desc = 'Harpoon 3' })
    vim.keymap.set('n', '<leader>o', function()
      ui.nav_file(4)
    end, { desc = 'Harpoon 4' })
  end,
}
