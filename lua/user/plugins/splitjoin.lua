return {
  'bennypowers/splitjoin.nvim',
  lazy = true,
  keys = {
    {
      'gj',
      function()
        require('splitjoin').join()
      end,
      desc = 'Join the object under cursor',
    },
    {
      '<C-CR>',
      function()
        require('splitjoin').split()
      end,
      desc = 'Split the object under cursor',
    },
  },
}
