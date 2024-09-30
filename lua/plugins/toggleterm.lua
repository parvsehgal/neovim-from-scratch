return {
  -- Configure LazyVim to load gruvbox

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,

    keys = {
      {
        "<leader>h",
        "<cmd>ToggleTerm size=12 dir=cwd direction=horizontal<cr>",
        desc = "Open a horizontal terminal at the Desktop directory",
      },
      {
        "<leader>ft",
        "<cmd> ToggleTerm size=10 dir=cwd direction=float<cr>"
      },
    },
  },
}

