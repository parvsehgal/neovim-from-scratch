return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup({
      options = {
        disabled_filetypes = { "neo-tree" }, -- Disable lualine for Neo-tree
      },
      sections = {
        lualine_a = { 'mode' }, -- Show the mode
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filetype', 'progress' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = { 'os.date("%H:%M")' }
      },
    })
  end
}

