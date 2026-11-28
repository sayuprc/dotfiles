-- ファイルツリーで隠しファイル・隠しフォルダをデフォルトで表示する

---@type LazySpec
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
      },
    },
  },
}
