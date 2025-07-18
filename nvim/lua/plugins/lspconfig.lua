return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    vim.lsp.config("*", {
      on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "gk", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "grn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "g>", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "g<", vim.diagnostic.goto_prev, opts)
        vim.api.nvim_create_autocmd("CursorHold", {
          callback = function()
            vim.diagnostic.open_float(nil, {
              focusable = false,
              style = "minimal",
              border = "single",
              source = "always",
              header = "",
              prefix = "",
            })
          end,
        })
        vim.opt.updatetime = 300
      end,
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
    })
    vim.lsp.enable("vim-language-server")
    vim.lsp.enable("lua-language-server")
    vim.lsp.enable("pyright")
    vim.lsp.enable("ruff")
    vim.lsp.enable("vtsls")
    vim.lsp.enable("prettier")
    vim.lsp.enable("svelte")
    vim.lsp.enable("tailwindcss-language-server")
    vim.lsp.enable("gopls")
    vim.opt.signcolumn = "yes"
  end
}
