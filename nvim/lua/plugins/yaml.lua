-- yamlls に SchemaStore のスキーマを渡す
-- astrocommunity.pack.yaml は on_new_config で渡しているが、Neovim 0.11 以降の vim.lsp.config では呼ばれず、スキーマが空になるため before_init で渡し直す

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@param opts AstroLSPOpts
  opts = function(_, opts)
    opts.config = opts.config or {}
    opts.config.yamlls = vim.tbl_deep_extend("force", opts.config.yamlls or {}, {
      before_init = function(_, config)
        config.settings.yaml.schemas =
          vim.tbl_deep_extend("force", config.settings.yaml.schemas or {}, require("schemastore").yaml.schemas())
      end,
    })
  end,
}
