-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "onedark",

  -- Keep panels visually separated without making the editor bright.
  hl_override = {
    -- The current file/folder in nvim-tree.
    NvimTreeCursorLine = { bg = "#11151c", fg = "#d8dee9" },

    -- Vertical explorer/editor and horizontal terminal separators.
    WinSeparator = { fg = "#0b0e12", bg = "NONE" },
    VertSplit = { fg = "#0b0e12", bg = "NONE" },
    NvimTreeWinSeparator = { fg = "#0b0e12", bg = "NONE" },

    -- Borders used by floating windows such as Telescope and DAP UI.
    FloatBorder = { fg = "#0b0e12", bg = "#1e222a" },
    TelescopeBorder = { fg = "#0b0e12", bg = "#1e222a" },
  },
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

return M
