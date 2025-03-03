return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-neotest/neotest-python',
    'nvim-neotest/neotest-go',
    'nvim-neotest/neotest-plenary',
  },
  keys = {
    {
      '<leader>tr',
      "<cmd>lua require('neotest').run.run()<cr>",
      desc = '[R]un nearest test',
    },
    {
      '<leader>tf',
      "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>",
      desc = 'Run current [f]ile',
    },
    {
      '<leader>ta',
      "<cmd>lua require('neotest').run.run({ suite = true })<cr>",
      desc = 'Run [a]ll tests',
    },
    {
      '<leader>td',
      "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",
      desc = '[D]ebug nearest test',
    },
    {
      '<leader>ts',
      "<cmd>lua require('neotest').run.stop()<cr>",
      desc = '[S]top test',
    },
    {
      '<leader>th',
      "<cmd>lua require('neotest').run.attach()<cr>",
      desc = 'Attac[h] to nearest test',
    },
    {
      '<leader>to',
      "<cmd>lua require('neotest').output.open()<cr>",
      desc = 'Show test [o]utput',
    },
    {
      '<leader>tp',
      "<cmd>lua require('neotest').output_panel.toggle()<cr>",
      desc = 'Toggle output [p]anel',
    },
    {
      '<leader>ts',
      "<cmd>lua require('neotest').summary.toggle()<cr>",
      desc = 'Toggle [s]ummary',
    },
  },
  config = function()
    require('neotest').setup {
      adapters = {
        require 'neotest-plenary',
        require 'neotest-python' {
          -- Extra arguments for nvim-dap configuration
          -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
          dap = { justMyCode = false },
          -- Command line arguments for runner
          -- Can also be a function to return dynamic values
          args = { '-vss', '--log-level', 'DEBUG' },
          -- Runner to use. Will use pytest if available by default.
          -- Can be a function to return dynamic value.
          runner = 'pytest',
          -- Custom python path for the runner.
          -- Can be a string or a list of strings.
          -- Can also be a function to return dynamic value.
          -- If not provided, the path will be inferred by checking for
          -- virtual envs in the local directory and for Pipenev/Poetry configs
          -- python = '.venv/bin/python',
          -- !!EXPERIMENTAL!! Enable shelling out to `pytest` to discover test
          -- instances for files containing a parametrize mark (default: false)
          pytest_discover_instances = false,
        },
        require 'neotest-go' {
          recursive_run = true,
          experimental = {
            test_table = true,
          },
        },
      },
    }
  end,
}
