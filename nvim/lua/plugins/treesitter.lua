return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  main = "nvim-treesitter.configs",
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    autotag = { enable = true },
    ensure_installed = {
      "bash",
      "html",
      "json",
      "yaml",
      "vim",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "javascript",
      "typescript",
      "tsx",
      "svelte",
    },
  },
}
