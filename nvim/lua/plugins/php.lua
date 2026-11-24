-- PHP を intelephense で編集する
-- AstroCommunity の pack.php は LSP に phpactor を使うため、使わずに必要な分だけ書く

---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      treesitter = { ensure_installed = { "php", "phpdoc" } },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "intelephense" })
    end,
  },
  {
    -- php ファイルでタグの自動閉じが有効だと補完 (blink.cmp) が壊れるため止める
    -- https://github.com/saghen/blink.cmp/issues/2234#issuecomment-3461410965
    "windwp/nvim-ts-autotag",
    optional = true,
    opts = {
      per_filetype = {
        ["php"] = { enable_close = false },
      },
    },
  },
}
