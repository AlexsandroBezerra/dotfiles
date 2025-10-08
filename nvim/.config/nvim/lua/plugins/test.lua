return {
  'vim-test/vim-test',
  dependencies = {
    'preservim/vimux',
  },
  keys = {
    { '<leader>tn', '<cmd>TestNearest -strategy=vimux<cr>', desc = 'Run [n]ear test' },
    { '<leader>tf', '<cmd>TestFile -strategy=vimux<cr>', desc = 'Run [f]ile test' },
    { '<leader>ta', '<cmd>TestSuite -strategy=vimux<cr>', desc = 'Run test [s]uite' },
    { '<leader>tl', '<cmd>TestLast -strategy=vimux<cr>', desc = 'Run [l]ast test' },
    { '<leader>tg', '<cmd>TestVisit<cr>', desc = 'Visit last test' },
  },
}
