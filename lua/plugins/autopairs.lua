return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter', -- Load on insert mode
  config = function()
    require('nvim-autopairs').setup {}
  end,
}

