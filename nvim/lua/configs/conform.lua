return {
  formatters_by_ft = {
    c = { "clang-format" },
    cpp = { "clang-format" },
    objc = { "clang-format" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    python = { "black" },
    lua = { "stylua" },
  },
  format_on_save = {
    timeout_ms = 3000,
    lsp_format = "fallback",
  },
}
