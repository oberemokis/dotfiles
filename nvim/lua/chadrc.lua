local M = {}

M.lsp = {
  signature = false,
}

M.base46 = {
  theme = "opencode",
  transparency = false,

  -- Color palette:
  -- --------------
  -- black
  -- darker_black
  -- white
  -- black2
  -- one_bg
  -- one_bg2
  -- one_bg3
  -- grey
  -- grey_fg
  -- grey_fg2
  -- light_grey
  -- red
  -- baby_pink
  -- pink
  -- line
  -- green
  -- vibrant_green
  -- nord_blue
  -- blue
  -- yellow
  -- sun
  -- purple
  -- dark_purple
  -- teal
  -- orange
  -- cyan
  -- statusline_bg
  -- lightbg
  -- pmenu_bg
  -- folder_bg

  hl_add = {
    NeoTreeNormal = { bg = "darker_black" },
    NeoTreeFloatTitle = { bg = "red", fg = "darker_black" },
    NeoTreeGitDeleted = { fg = "red" },
    NotifyERRORBorder = { fg = "red" },
    NotifyWARNBorder = { fg = "yellow" },
    NotifyINFOBorder = { fg = "green" },
    NotifyDEBUGBorder = { fg = "magenta" },
    NotifyTRACEBorder = { fg = "green" },
    NotifyERRORIcon = { fg = "red" },
    NotifyWARNIcon = { fg = "yellow" },
    NotifyINFOIcon = { fg = "green" },
    NotifyDEBUGIcon = { fg = "magenta" },
    NotifyTRACEIcon = { fg = "green" },
    NotifyERRORTitle = { fg = "red" },
    NotifyWARNTitle = { fg = "yellow" },
    NotifyINFOTitle = { fg = "green" },
    NotifyDEBUGTitle = { fg = "magenta" },
    NotifyTRACETitle = { fg = "green" },
    InclineNormal = { fg = "dark_purple", bg = "black" },
    InclineNormalNC = { fg = "grey", bg = "black" },
    NoiceCmdlinePopupTitle = { fg = "darker_black", bg = "purple" },
    NoiceCmdlinePopupBorder = { fg = "dark_purple" },
    htmlEndTag = { fg = "blue" },
  },
  hl_override = {
    TbFill = { bg = "black" },
    TbBufOn = { fg = "white", bg = "black2" },
    TbBufOnClose = { fg = "red", bg = "one_bg2" },
  },
  changed_themes = {
    monochrome = {
      base_16 = {
        base00 = "#101010",
        base01 = "#1f1f1f",
        base02 = "#2e2e2e",
        base03 = "#383838",
        base04 = "#424242",
        base05 = "#c7ccd1",
        base06 = "#c7cdd8",
        base07 = "#ced4df",
        base08 = "#c7ae95",
        base09 = "#c7c795",
        base0A = "#aec795",
        base0B = "#7b9198",
        base0C = "#95aec7",
        base0D = "#ae95c7",
        base0E = "#c795ae",
        base0F = "#c79595",
      },
      base_30 = {
        white = "#D8DEE9",
        darker_black = "#1a1a1a",
        black = "#101010", --  nvim bg
        black2 = "#202020",
        one_bg = "#242424",
        one_bg2 = "#2e2e2e",
        one_bg3 = "#383838",
        grey = "#424242",
        grey_fg = "#4c4c4c",
        grey_fg2 = "#606060",
        light_grey = "#677777",
        red = "#ec8989",
        baby_pink = "#eca8a8",
        pink = "#da838b",
        line = "#2e2e2e", -- for lines like vertsplit
        green = "#c9d36a",
        vibrant_green = "#eff6ab",
        blue = "#8abae1",
        nord_blue = "#a5c6e1",
        yellow = "#ffe6b5",
        sun = "#eff6ab",
        purple = "#e1bee9",
        dark_purple = "#db9fe9",
        teal = "#6484a4",
        orange = "#efb6a0",
        cyan = "#9aafe6",
        statusline_bg = "#1e1e1e",
        lightbg = "#2e2e2e",
        pmenu_bg = "#859ba2",
        folder_bg = "#7797b7",
      },
    },
  },
}

M.ui = {
  statusline = {
    enabled = true,
    theme = "vscode", -- default | vscode | vscode_colored | minimal
    order = {
      "git",
      "%=",
      "diagnostics",
    },
  },

  telescope = {
    style = "borderless", -- borderless | bordered
  },

  cmp = {
    icons = true,
    lspkind_text = true,
    style = "flat_light", -- default | flat_light | atom | atom_colored
  },

  tabufline = {
    order = { "treeOffset", "buffers", "tabs" },
  },

  nvdash = {
    load_on_startup = false,

    header = {
      "          ૮₍ ˶• ༝ •˶ ₎ა          ",
    },
    buttons = {
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
  },
}

return M
