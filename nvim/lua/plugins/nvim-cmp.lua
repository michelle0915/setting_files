return {
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      cmp.setup {
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)  -- vsnip を使う場合
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "vsnip" },
        }, {
          { name = "buffer" },
        })
      }
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" }
        }
      })
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" }
        }, {
          { name = "cmdline" }
        }),
        matching = { disallow_symbol_nonprefix_matching = false }
      })
    end,
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    event = "InsertEnter",
    dependencies = { "hrsh7th/nvim-cmp" },
  },
  {
    "hrsh7th/cmp-buffer",
    event = "InsertEnter",
    dependencies = { "hrsh7th/nvim-cmp" },
  },
  {
    "hrsh7th/cmp-path",
    event = "InsertEnter",
    dependencies = { "hrsh7th/nvim-cmp" },
  },
  {
    "hrsh7th/cmp-cmdline",
    event = "CmdlineEnter",
    dependencies = { "hrsh7th/nvim-cmp" },
  },
  {
    "hrsh7th/cmp-vsnip",
    event = "InsertEnter",
    dependencies = { "hrsh7th/nvim-cmp", "hrsh7th/vim-vsnip" },
  },
  {
    "hrsh7th/vim-vsnip",
    event = "InsertEnter",
  },
}
