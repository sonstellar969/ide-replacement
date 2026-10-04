-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "onedark",

  -- Keep the interface readable while preserving a dark workspace.
  hl_override = {
    -- Editor text, background, comments, and line numbers.
    Normal = { fg = "#e6eaf2", bg = "#1c2129" },
    NormalFloat = { fg = "#e6eaf2", bg = "#202631" },
    Comment = { fg = "#8f9baa", italic = true },
    LineNr = { fg = "#7f8c9f" },
    CursorLine = { bg = "#242b35" },
    CursorLineNr = { fg = "#e6eaf2", bold = true },
    NonText = { fg = "#596579" },

    -- The current file/folder in nvim-tree.
    NvimTreeNormal = { fg = "#dfe5ee", bg = "#1c2129" },
    NvimTreeNormalNC = { fg = "#c8d0dc", bg = "#1c2129" },
    NvimTreeCursorLine = { bg = "#303947", fg = "#ffffff", bold = true },
    NvimTreeFolderName = { fg = "#d6deea" },
    NvimTreeOpenedFolderName = { fg = "#ffffff", bold = true },
    NvimTreeRootFolder = { fg = "#ffffff", bold = true },

    -- Vertical explorer/editor and horizontal terminal separators.
    WinSeparator = { fg = "#0b0f15", bg = "NONE" },
    VertSplit = { fg = "#0b0f15", bg = "NONE" },
    NvimTreeWinSeparator = { fg = "#0b0f15", bg = "NONE" },
    StatusLine = { fg = "#e6eaf2", bg = "#2a303b" },
    StatusLineNC = { fg = "#aeb8c7", bg = "#202631" },

    -- Borders used by floating windows such as Telescope and DAP UI.
    FloatBorder = { fg = "#0b0f15", bg = "#202631" },
    TelescopeBorder = { fg = "#0b0f15", bg = "#202631" },
  },
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

return M
