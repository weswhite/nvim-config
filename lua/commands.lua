local api = vim.api

-- Custom commands
api.nvim_create_user_command("Format", function()
  require("conform").format({ lsp_fallback = true })
end, { desc = "Format current buffer" })

api.nvim_create_user_command("TSFix", function()
  vim.cmd("EslintFixAll")
  require("conform").format({ lsp_fallback = true })
end, { desc = "Fix TypeScript issues and format" })

api.nvim_create_user_command("ProjectReplace", function()
  require("spectre").toggle()
end, { desc = "Open project-wide search and replace" })

api.nvim_create_user_command("InlayHintsToggle", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints" })
