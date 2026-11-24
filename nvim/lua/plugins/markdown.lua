-- Markdown の整形表示 (render-markdown.nvim) を切り替えるキー

---@type LazySpec
return {
  "MeanderingProgrammer/render-markdown.nvim",
  keys = {
    { "<Leader>um", "<Cmd>RenderMarkdown toggle<CR>", desc = "Toggle markdown render" },
  },
}
