-- ファイルのアイコンを Material 風 (nvim-material-icon) にする
-- nvim-material-icon は nvim-web-devicons の置き換えだが、AstroNvim は mini.icons でアイコンを出すため、データだけを読んで mini.icons に渡す

local function material_dir()
  local plugin = require("lazy.core.config").plugins["nvim-material-icon"]
  return plugin and plugin.dir .. "/lua/nvim-web-devicons/default/"
end

local function hl_name(color) return "MaterialIcon" .. color:sub(2) end

---@type LazySpec
return {
  {
    -- 読み込むと nvim-web-devicons として振る舞おうとするため、読み込まずにファイルだけを使う
    "DaikyXendo/nvim-material-icon",
    lazy = true,
  },
  {
    "nvim-mini/mini.icons",
    opts = function(_, opts)
      local dir = material_dir()
      if not dir or vim.fn.isdirectory(dir) == 0 then return end

      local colors = {}
      local function convert(icons)
        local result = {}
        for name, icon in pairs(icons) do
          if icon.icon and icon.color then
            colors[icon.color] = true
            result[name] = { glyph = icon.icon, hl = hl_name(icon.color) }
          end
        end
        return result
      end

      opts.extension = vim.tbl_extend("force", opts.extension or {}, convert(dofile(dir .. "icons_by_file_extension.lua")))
      opts.file = vim.tbl_extend("force", opts.file or {}, convert(dofile(dir .. "icons_by_filename.lua")))

      -- 配色を変えるとハイライトが消えるため、そのたびに定義し直す
      local function apply()
        for color in pairs(colors) do
          vim.api.nvim_set_hl(0, hl_name(color), { fg = color })
        end
      end
      apply()
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = vim.api.nvim_create_augroup("material_icons", { clear = true }),
        callback = apply,
      })
    end,
  },
}
