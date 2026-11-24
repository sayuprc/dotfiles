-- Dockerfile、Compose、Bake ファイルを docker-language-server (VS Code の Docker DX と同じ LSP) で編集する

---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      -- docker-language-server は yaml.docker-compose / hcl.docker-bake でないと動かないが、Neovim は yaml / hcl と判定するため
      filetypes = {
        filename = {
          ["compose.yaml"] = "yaml.docker-compose",
          ["compose.yml"] = "yaml.docker-compose",
          ["docker-compose.yaml"] = "yaml.docker-compose",
          ["docker-compose.yml"] = "yaml.docker-compose",
          ["docker-bake.hcl"] = "hcl.docker-bake",
          ["docker-bake.override.hcl"] = "hcl.docker-bake",
        },
      },
      treesitter = { ensure_installed = { "dockerfile", "yaml", "hcl" } },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "docker-language-server" })
    end,
  },
}
