return {
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
}
