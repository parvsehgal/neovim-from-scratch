
return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {"lua_ls" , "ts_ls"}
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      
      -- Format on save
      local function on_attach(client, bufnr)
        if client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format()
            end
          })
        end
      end

      -- Lua setup
      lspconfig.lua_ls.setup({})

      -- TypeScript/JavaScript setup with ts_ls
      lspconfig.ts_ls.setup({
        on_attach = on_attach,  -- Enable format on save
      })

      -- Key mappings
      vim.keymap.set('n','}',vim.lsp.buf.hover,{})
      vim.keymap.set("n", "<C-]>", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end
  },
  -- Autocompletion

{
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "L3MON4D3/LuaSnip"  -- Snippet support
  },
  config = function()
    local cmp = require'cmp'
    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      mapping = {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Down>'] = cmp.mapping.select_next_item(),  -- Down arrow to navigate suggestions
        ['<Up>'] = cmp.mapping.select_prev_item(),    -- Up arrow to navigate suggestions
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
      })
    })
  end
}
}

