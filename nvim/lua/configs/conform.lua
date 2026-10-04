return {
  formatters_by_ft = {
    c = { "clang_format" },
    cpp = { "clang_format" },
    objc = { "clang_format" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    python = { "black" },
    lua = { "stylua" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },
}
