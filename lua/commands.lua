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
-- ESLint commands (add these to your commands.lua)
api.nvim_create_user_command("ESLintFix", function()
  vim.cmd("EslintFixAll")
end, { desc = "Fix all ESLint issues" })

api.nvim_create_user_command("ESLintInfo", function()
  vim.cmd("LspInfo")
end, { desc = "Show ESLint LSP info" })

-- Enhanced TSFix command
api.nvim_create_user_command("TSFix", function()
  vim.cmd("EslintFixAll")
  vim.defer_fn(function()
    require("conform").format({ lsp_fallback = true })
  end, 100)
end, { desc = "Fix TypeScript issues and format", bang = true })
