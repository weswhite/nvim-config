local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "eslint_d", "prettier" },
    typescript = { "eslint_d", "prettier" },
    javascriptreact = { "eslint_d", "prettier" },
    typescriptreact = { "eslint_d", "prettier" },
    json = { "prettier" },
    markdown = { "prettier" },
    yaml = { "prettier" },
    scss = { "prettier" },
    less = { "prettier" },
  },

  format_on_save = {
    timeout_ms = 3000,
    lsp_fallback = true,
  },

  formatters = {
    eslint_d = {
      command = "eslint_d",
      args = { "--fix-to-stdout", "--stdin", "--stdin-filename", "$FILENAME" },
      stdin = true,
    },
  },
}

return options
