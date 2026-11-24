-- 右クリックでクリップボードから貼り付ける

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- mouse=a だと右クリックが Neovim のメニューになり、Windows Terminal の貼り付けが効かないため、クリップボードからの貼り付けにする
    mappings = {
      n = { ["<RightMouse>"] = { '"+p', desc = "Paste from clipboard" } },
      v = { ["<RightMouse>"] = { '"+p', desc = "Paste from clipboard" } },
      i = { ["<RightMouse>"] = { "<C-r><C-o>+", desc = "Paste from clipboard" } },
      t = { ["<RightMouse>"] = { [[<C-\><C-n>"+pi]], desc = "Paste from clipboard" } },
    },
  },
}
