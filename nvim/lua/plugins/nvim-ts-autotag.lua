return {
  "windwp/nvim-ts-autotag",
  dependencies = {
    "nvim-treesitter/nvim-treesitter"
  },
  config = function()
    require("nvim-ts-autotag").setup()
  end,
  ft = {
    "html",
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "svelte",
    "vue",
    "xml"
  },
}

