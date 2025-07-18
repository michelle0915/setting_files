return {
  "petertriho/nvim-scrollbar",
  config = function()
    local colors = {
      bg            = "#1e2326",
      bg_highlight  = "#2e383c",
      fg            = "#d3c6aa",
      error         = "#e67e80",
      warning       = "#dbbc7f",
      info          = "#7fbbb3",
      hint          = "#83c092",
      orange        = "#e69875",
      purple        = "#d699b6",
    }

    require("scrollbar").setup({
      handle = {
        color = colors.bg_highlight,
      },
      marks = {
        Search = { color = colors.orange },
        Error = { color = colors.error },
        Warn = { color = colors.warning },
        Info = { color = colors.info },
        Hint = { color = colors.hint },
        Misc = { color = colors.purple },
      }
    })
  end,
}
