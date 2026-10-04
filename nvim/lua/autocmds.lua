require "nvchad.autocmds"

local function apply_readability_highlights()
  local highlights = {
    Normal = { fg = "#e6eaf2", bg = "#1c2129" },
    NormalFloat = { fg = "#e6eaf2", bg = "#202631" },
    Comment = { fg = "#8f9baa", italic = true },
    LineNr = { fg = "#7f8c9f" },
    CursorLine = { bg = "#242b35" },
    CursorLineNr = { fg = "#e6eaf2", bold = true },
    NonText = { fg = "#596579" },
    WinSeparator = { fg = "#596579", bg = "NONE" },
    VertSplit = { fg = "#596579", bg = "NONE" },
    StatusLine = { fg = "#e6eaf2", bg = "#2a303b" },
    StatusLineNC = { fg = "#aeb8c7", bg = "#202631" },
    FloatBorder = { fg = "#596579", bg = "#202631" },
    TelescopeBorder = { fg = "#596579", bg = "#202631" },
    NvimTreeNormal = { fg = "#dfe5ee", bg = "#1c2129" },
    NvimTreeNormalNC = { fg = "#c8d0dc", bg = "#1c2129" },
    NvimTreeCursorLine = { bg = "#303947", fg = "#ffffff", bold = true },
    NvimTreeFolderName = { fg = "#d6deea" },
    NvimTreeOpenedFolderName = { fg = "#ffffff", bold = true },
    NvimTreeRootFolder = { fg = "#ffffff", bold = true },
    NvimTreeWinSeparator = { fg = "#596579", bg = "NONE" },
  }

  for name, value in pairs(highlights) do
    vim.api.nvim_set_hl(0, name, value)
  end
end

-- Apply once now, then again after NvChad changes the colorscheme. This also
-- covers nvim-tree, which creates its own highlight groups lazily.
apply_readability_highlights()
vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter", "FileType" }, {
  pattern = { "*", "NvimTree" },
  callback = apply_readability_highlights,
})
