local M = {}

function M.setup()
  require("nvchad.configs.lspconfig").defaults()

  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  local on_attach = function(_, bufnr)
    local opts = { buffer = bufnr, silent = true }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  end

  local common = {
    capabilities = capabilities,
    on_attach = on_attach,
  }

  local servers = { "clangd", "pyright", "rust_analyzer", "ts_ls", "lua_ls" }
  for _, server in ipairs(servers) do
    vim.lsp.config(server, common)
  end

  vim.lsp.config("clangd", vim.tbl_deep_extend("force", common, {
    cmd = { "clangd", "--background-index", "--clang-tidy" },
  }))
  vim.lsp.config("rust_analyzer", vim.tbl_deep_extend("force", common, {
    settings = { ["rust-analyzer"] = { cargo = { allFeatures = true } } },
  }))
  vim.lsp.config("lua_ls", vim.tbl_deep_extend("force", common, {
    settings = {
      Lua = {
        diagnostics = { globals = { "vim" } },
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
      },
    },
  }))

  vim.lsp.enable(servers)
end

return M
