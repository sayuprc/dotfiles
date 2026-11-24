-- Terraform を terraform-ls で編集する

---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      -- Neovim は .tf を TinyFugue の tf と判定するため
      filetypes = {
        extension = {
          tf = "terraform",
          tfvars = "terraform-vars",
        },
      },
      treesitter = { ensure_installed = { "terraform", "hcl" } },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "terraform-ls" })
    end,
  },
}
