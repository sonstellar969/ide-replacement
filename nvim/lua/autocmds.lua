require "nvchad.autocmds"

-- nvim-tree creates its highlight groups when the tree opens. Reapply the
-- selected-row color then so it remains visible after lazy loading.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "NvimTree",
  callback = function()
    vim.api.nvim_set_hl(0, "NvimTreeCursorLine", {
      bg = "#11151c",
      fg = "#d8dee9",
    })
  end,
})
