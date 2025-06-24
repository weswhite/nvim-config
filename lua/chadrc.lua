---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "onedark",
  
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.plugins = "plugins"

-- Load custom commands
require "commands"

return M
