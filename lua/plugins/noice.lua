---@type LazySpec
return {
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify', -- optional, but recommended
    },
    opts = {
      lsp = {
        progress = {
          enabled = true,
          -- lower update frequency a bit to reduce UI churn
          throttle = 1000 / 30,
          view = 'mini',
        },
        hover = {
          enabled = true,
          silent = true,
        },
        signature = {
          enabled = true,
          auto_open = {
            enabled = true,
            trigger = true,
            luasnip = true,
            throttle = 50,
          },
        },
        message = {
          enabled = true,
          view = 'notify',
        },
        -- Better markdown rendering for hover / cmp docs
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },

      cmdline = {
        enabled = true,
        view = 'cmdline_popup',
        format = {
          cmdline = { pattern = '^:', icon = '', lang = 'vim' },
          search_down = { kind = 'search', pattern = '^/', icon = ' ', lang = 'regex' },
          search_up = { kind = 'search', pattern = '^%?', icon = ' ', lang = 'regex' },
          filter = { pattern = '^:%s*!', icon = '$', lang = 'bash' },
          lua = { pattern = '^:%s*lua%s+', icon = '', lang = 'lua' },
          help = { pattern = '^:%s*he?l?p?%s+', icon = '󰋖' },
        },
      },

      messages = {
        enabled = true,
        view = 'mini',
        view_error = 'notify',
        view_warn = 'notify',
        view_history = 'messages',
        view_search = 'virtualtext',
      },

      notify = {
        enabled = true,
        view = 'notify',
      },

      popupmenu = {
        enabled = true,
        backend = 'nui',
      },

      routes = {
        -- Send very long messages to a split, not a popup
        {
          filter = {
            event = 'msg_show',
            min_height = 10,
          },
          view = 'split',
        },
        -- Skip noisy "written" messages
        {
          filter = {
            event = 'msg_show',
            kind = '',
            find = 'written',
          },
          opts = { skip = true },
        },
        -- Skip noisy mode messages like -- INSERT --
        {
          filter = {
            event = 'msg_showmode',
          },
          opts = { skip = true },
        },
      },

      presets = {
        bottom_search = true, -- classic / search UI at the bottom
        command_palette = true, -- cmdline + popupmenu together
        long_message_to_split = true, -- useful for :messages, verbose output, etc.
        inc_rename = true, -- nicer UI for inc-rename.nvim
        lsp_doc_border = true, -- bordered hover/signature docs
      },
    },
    config = function(_, opts)
      require('noice').setup(opts)

      -- Make vim.notify use nvim-notify/noice
      vim.notify = require 'notify'
    end,
  },

  {
    'rcarriga/nvim-notify',
    opts = {
      timeout = 3000,
      background_colour = '#000000',
      render = 'wrapped-compact',
      stages = 'fade_in_slide_out',
    },
  },
}
