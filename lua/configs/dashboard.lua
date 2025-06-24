local function default_header()
  return {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
    "            [ TypeScript Development Ready ]         ",
    "                                                     ",
  }
end

return {
  theme = "doom",
  config = {
    header = default_header(),
    center = {
      {
        icon = " ",
        desc = "Find File                               ",
        key = "f",
        action = "Telescope find_files",
      },
      {
        icon = " ",
        desc = "Recent Files                           ",
        key = "r",
        action = "Telescope oldfiles",
      },
      {
        icon = " ",
        desc = "Find Word                              ",
        key = "w",
        action = "Telescope live_grep",
      },
      {
        icon = " ",
        desc = "New File                               ",
        key = "n",
        action = "enew",
      },
      {
        icon = " ",
        desc = "Git Status                             ",
        key = "g",
        action = "Git",
      },
      {
        icon = " ",
        desc = "Configurations                         ",
        key = "c",
        action = "edit ~/.config/nvim/init.lua",
      },
      {
        icon = " ",
        desc = "Restore Session                        ",
        key = "s",
        action = "lua require('persistence').load()",
      },
      {
        icon = " ",
        desc = "Quit                                   ",
        key = "q",
        action = "quit",
      },
    },
  },
}
