return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-neotest/neotest-go',
  },
  config = function()
    require('neotest').setup {
      adapters = {
        require 'neotest-go' {
          experimental = {
            test_table = true,
          },
          args = { '-count=1', '-timeout=60s' },
        },
      },
    }
  end,
  keys = {
    { '<leader>T', '', desc = '+[T]est' },
    {
      '<leader>Tt',
      function()
        require('neotest').run.run()
      end,
      desc = 'Run nearest test ',
    },
    {
      '<leader>Ts',
      function()
        require('neotest').summary.toggle()
      end,
      desc = 'Toggle test summary',
    },
    {
      '<leader>To',
      function()
        require('neotest').output_panel.toggle()
      end,
      desc = 'Toggle test output panel',
    },
  },
}
