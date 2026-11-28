-- WSL では Markdown のプレビュー (markdown-preview.nvim) を Windows の既定ブラウザで開く

---@type LazySpec
return {
  {
    "iamcco/markdown-preview.nvim",
    -- AstroCommunity の build は mkdp#util#install() を呼ぶが、遅延読み込みのためビルド時に autoload が見つからず失敗する
    build = "cd app && ./install.sh",
  },
  {
    "AstroNvim/astrocore",
    ---@param opts AstroCoreOpts
    opts = function(_, opts)
      if vim.fn.has("wsl") == 0 then return end
      -- markdown-preview.nvim の init は AstroCommunity 側で定義されており、上書きすると mkdp_filetypes が消えるため astrocore で設定する
      -- WSL には Linux のブラウザがなく自動で開けないため、explorer.exe に URL を渡して Windows 側で開く
      vim.cmd([[
        function! MkdpOpenInWindows(url) abort
          call jobstart(['explorer.exe', a:url], {'detach': v:true})
        endfunction
      ]])
      opts.options = opts.options or {}
      opts.options.g = opts.options.g or {}
      opts.options.g.mkdp_browserfunc = "MkdpOpenInWindows"
    end,
  },
}
