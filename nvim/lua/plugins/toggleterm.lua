-- ターミナルを高さ 20 行で開き、Ctrl-l をシェルに渡す。F8 で新しいターミナルを足す

-- 番号付きの F7 はターミナルの中では番号がシェルに入ってしまうため、番号を使わずに次の番号のターミナルを開く
local function new_terminal()
  local max_id = 0
  for _, term in ipairs(require("toggleterm.terminal").get_all(true)) do
    max_id = math.max(max_id, term.id)
  end
  require("toggleterm").toggle(max_id + 1)
end

---@type LazySpec
return {
  {
    "akinsho/toggleterm.nvim",
    opts = { size = 20 },
  },
  {
    -- AstroNvim の <Leader>th は size=10 を直接指定しているため、こちらも上書きする
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<Leader>th"] = { "<Cmd>ToggleTerm size=20 direction=horizontal<CR>", desc = "ToggleTerm horizontal split" },
          ["<F8>"] = { new_terminal, desc = "New terminal" },
        },
        i = {
          ["<F8>"] = { new_terminal, desc = "New terminal" },
        },
        t = {
          -- AstroNvim はターミナルの Ctrl-l を右のウィンドウへの移動に使うため、シェルの画面クリアができなくなる
          ["<C-L>"] = false,
          ["<F8>"] = { new_terminal, desc = "New terminal" },
        },
      },
    },
  },
}
