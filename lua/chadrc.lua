-- This file  needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "tokyonight",
  theme_toggle = { "tokyonight", "one_light" },
  telescope = { style = "bordered" }, -- borderless / bordered

  transparency = true,

  -- hl_override = {
  --   Comment = { italic = true },
  --   ["@comment"] = { italic = true },
  -- },

  tabufline = {
    -- enabled = false,
  },
}

return M
