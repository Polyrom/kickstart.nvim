-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

---@module 'lazy'
---@type LazySpec
return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '<leader>e', '<cmd>Neotree toggle reveal left<CR>', desc = 'Neo-tree toggle', silent = true },
  },
  ---@module 'neo-tree'
  ---@type neotree.Config
  opts = {
    close_if_last_window = true,
    popup_border_style = 'rounded',
    enable_git_status = true,
    enable_diagnostics = true,

    filesystem = {
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },
      use_libuv_file_watcher = true,
      hijack_netrw_behavior = 'open_default',
      filtered_items = {
        visible = true, -- show filtered items faintly instead of hiding them completely
        hide_dotfiles = false, -- show hidden files by default
        hide_gitignored = false, -- often useful during development
        hide_hidden = false, -- important on Windows / general hidden attrs
      },
      window = {
        position = 'left',
        width = 32,
        mappings = {
          ['\\'] = 'close_window',
          ['l'] = 'open',
          ['h'] = 'close_node',
          ['<cr>'] = 'open',
          ['o'] = 'open',
          ['a'] = 'add',
          ['A'] = 'add_directory',
          ['d'] = 'delete',
          ['r'] = 'rename',
          ['y'] = 'copy_to_clipboard',
          ['x'] = 'cut_to_clipboard',
          ['p'] = 'paste_from_clipboard',
          ['R'] = 'refresh',
          ['H'] = 'toggle_hidden',
          ['/'] = 'filter_as_you_type',
        },
      },
    },

    window = {
      mappings = {
        ['<space>'] = 'none',
      },
    },

    default_component_configs = {
      indent = {
        with_expanders = true,
        expander_collapsed = '',
        expander_expanded = '',
      },
      git_status = {
        symbols = {
          added = '',
          modified = '',
          deleted = '✖',
          renamed = '󰁕',
          untracked = '',
          ignored = '',
          unstaged = '󰄱',
          staged = '',
          conflict = '',
        },
      },
    },
  },
}
