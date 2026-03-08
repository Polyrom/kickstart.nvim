return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  dependencies = {
    { 'nvim-tree/nvim-web-devicons' },
  },
  config = function()
    local dashboard = require 'dashboard'
    local telescope_builtin = require 'telescope.builtin'
    local devicons = require 'nvim-web-devicons'

    local leader = '󱁐' -- visual hint for <leader>

    local function icon(name, ext, fallback)
      local ico = devicons.get_icon(name, ext, { default = false })
      return (ico or fallback or '') .. ' '
    end

    dashboard.setup {
      theme = 'doom',
      config = {
        header = {
          '                                                     ',
          '███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗   ',
          '████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║   ',
          '██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║   ',
          '██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║   ',
          '██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║   ',
          '╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝   ',
          '                                                     ',
          '                                                     ',
          '                                                     ',
          '                                                     ',
          '                                                     ',
          '                                                     ',
        },

        center = {
          {
            icon = icon('FindMe.txt', 'txt', ''),
            icon_hl = 'Title',
            desc = 'Find files                         ',
            desc_hl = 'String',
            key = 'sf',
            keymap = '',
            key_hl = 'Number',
            key_format = ' %s',
            action = telescope_builtin.find_files,
          },
          {
            icon = icon('Search.log', 'log', '󰱼'),
            icon_hl = 'Title',
            desc = 'Live grep                          ',
            desc_hl = 'String',
            key = 'sg',
            keymap = '',
            key_hl = 'Number',
            key_format = ' %s',
            action = telescope_builtin.live_grep,
          },
          {
            icon = icon('Recent.md', 'md', ''),
            icon_hl = 'Title',
            desc = 'Recent files                       ',
            desc_hl = 'String',
            key = 'sr',
            keymap = '',
            key_hl = 'Number',
            key_format = ' %s',
            action = telescope_builtin.oldfiles,
          },
          {
            icon = icon('Help.txt', 'txt', '󰋖'),
            icon_hl = 'Title',
            desc = 'Help tags                          ',
            desc_hl = 'String',
            key = 'sh',
            keymap = '',
            key_hl = 'Number',
            key_format = ' %s',
            action = telescope_builtin.help_tags,
          },
          {
            icon = icon('init.lua', 'lua', ''),
            icon_hl = 'Title',
            desc = 'Edit Neovim config                 ',
            desc_hl = 'String',
            key = 'ce',
            keymap = '',
            key_hl = 'Number',
            key_format = ' %s',
            action = function() vim.cmd 'edit $MYVIMRC' end,
          },
          {
            icon = icon('new.lua', 'lua', ''),
            icon_hl = 'Title',
            desc = 'New file                           ',
            desc_hl = 'String',
            key = 'nn',
            keymap = '',
            key_hl = 'Number',
            key_format = ' %s',
            action = function() vim.cmd 'ene' end,
          },
          {
            icon = icon('lazy.lua', 'lua', '󰒲'),
            icon_hl = 'Title',
            desc = 'Plugin manager                     ',
            desc_hl = 'String',
            key = 'll',
            keymap = '',
            key_hl = 'Number',
            key_format = ' %s',
            action = 'Lazy',
          },
          {
            icon = icon('quit.sh', 'sh', ''),
            icon_hl = 'Title',
            desc = 'Quit Neovim                        ',
            desc_hl = 'String',
            key = 'q',
            keymap = '',
            key_hl = 'Number',
            key_format = ' %s',
            action = 'qa',
          },
        },

        footer = {},
        vertical_center = true,
      },
    }
  end,
}
