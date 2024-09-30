return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- Correct dependency syntax
  config = function()
    require('bufferline').setup {
      options = {
        offsets = {
          {
            filetype = "neo-tree", -- The filetype for Neo-tree
            text = "File Explorer", -- The label that will appear in the bufferline for Neo-tree
            highlight = "Directory", -- Highlight group for the text
            text_align = "left", -- Align the label (can be "left", "center", or "right")
            separator = true -- Show a separator between the sidebar and the buffers
          }
        },
        -- Add other bufferline options here if needed
      }
    }
  end,
}

