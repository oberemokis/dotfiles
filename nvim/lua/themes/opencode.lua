-- opencode: порт темы opencode (Zed) на base46
-- Источник значений: ~/.config/zed/themes/opencode.json, вариант "OpenCode" (dark)

local M = {}

M.base_30 = {
  white = "#eeeeee",
  darker_black = "#141414", -- панели и всплывающие окна: в Zed они светлее редактора
  black = "#0a0a0a", --  nvim bg
  black2 = "#141414",
  one_bg = "#1e1e1e",
  one_bg2 = "#282828",
  one_bg3 = "#323232",
  grey = "#484848",
  grey_fg = "#aeaeae", -- цвет комментариев в opencode
  grey_fg2 = "#8a8a8a",
  light_grey = "#808080",
  red = "#e06c75",
  baby_pink = "#fec1dd",
  pink = "#f799c6",
  line = "#282828", -- for lines like vertsplit
  green = "#96e3a7",
  vibrant_green = "#7fd88f",
  nord_blue = "#82b3f8",
  blue = "#5c9cf5",
  yellow = "#e5c07b",
  sun = "#eed09a",
  purple = "#9f9af7",
  dark_purple = "#9d7cd8",
  teal = "#4fd6be",
  orange = "#fab283",
  cyan = "#93eaf6",
  statusline_bg = "#141414",
  lightbg = "#1e1e1e",
  pmenu_bg = "#fab283",
  folder_bg = "#fab283",
}

M.base_16 = {
  base00 = "#0a0a0a",
  base01 = "#141414",
  base02 = "#282828",
  base03 = "#484848",
  base04 = "#808080",
  base05 = "#ededed",
  base06 = "#eeeeee",
  base07 = "#ffffff",
  base08 = "#f799c6",
  base09 = "#93eaf6",
  base0A = "#9f9af7",
  base0B = "#96e3a7",
  base0C = "#93eaf6",
  base0D = "#fec1dd",
  base0E = "#f799c6",
  base0F = "#8a8a8a",
}

M.polish_hl = {
  defaults = {
    Cursor = { fg = M.base_30.black, bg = M.base_30.orange },
    TermCursor = { fg = M.base_30.black, bg = M.base_30.orange },
    Visual = { bg = M.base_30.one_bg3 },
    Search = { fg = M.base_30.white, bg = "#2c4463" },
    IncSearch = { fg = M.base_30.black, bg = M.base_30.orange },
    CurSearch = { fg = M.base_30.black, bg = M.base_30.orange },
    Substitute = { fg = M.base_30.black, bg = M.base_30.orange },
    FloatBorder = { fg = M.base_30.one_bg2, bg = M.base_30.darker_black },
    FloatTitle = { fg = M.base_30.orange, bg = M.base_30.darker_black },
    WinSeparator = { fg = M.base_30.line },
    CursorLineNr = { fg = M.base_30.white },
    LineNr = { fg = M.base_30.grey },
    Title = { fg = M.base_30.pink, bold = true },
    Directory = { fg = M.base_30.orange },
    NonText = { fg = "#3c3c3c" },
    SpecialKey = { fg = "#3c3c3c" },
    Changed = { fg = "#e5c07b" },
    Added = { fg = "#4fd6be" },
    Removed = { fg = "#c53b53" },
    DiffAdd = { bg = "#20303b" },
    DiffChange = { bg = "#1e1e1e" },
    DiffDelete = { bg = "#37222c" },
    DiffText = { bg = "#2d1f26" },
  },

  syntax = {
    Identifier = { fg = M.base_16.base05 },
    Constant = { fg = M.base_30.cyan },
    Character = { fg = M.base_30.green },
    Operator = { fg = M.base_30.orange },
    Delimiter = { fg = M.base_30.grey_fg2 },
    Conditional = { fg = "#f06ba8" },
    Repeat = { fg = "#f06ba8" },
    Include = { fg = "#e79ad9" },
    Define = { fg = "#e79ad9" },
    PreProc = { fg = M.base_16.base05 },
    StorageClass = { fg = M.base_30.pink },
    Structure = { fg = M.base_30.purple },
    Tag = { fg = M.base_30.pink },
    Label = { fg = M.base_30.purple },
    Type = { fg = M.base_30.purple },
    Typedef = { fg = M.base_30.purple },
  },

  treesitter = {
    -- в opencode переменные, свойства и параметры остаются нейтральными
    ["@variable"] = { fg = M.base_16.base05 },
    ["@variable.parameter"] = { fg = M.base_16.base05 },
    ["@variable.member"] = { fg = M.base_16.base05 },
    ["@variable.member.key"] = { fg = M.base_16.base05 },
    ["@variable.builtin"] = { fg = M.base_30.pink },
    ["@property"] = { fg = M.base_16.base05 },
    ["@module"] = { fg = M.base_16.base05 },
    ["@field"] = { fg = M.base_16.base05 },

    ["@constant"] = { fg = M.base_30.cyan },
    ["@constant.builtin"] = { fg = M.base_30.cyan },
    ["@constant.macro"] = { fg = M.base_30.cyan },
    ["@character"] = { fg = M.base_30.green },
    ["@character.special"] = { fg = M.base_30.cyan },

    ["@keyword"] = { fg = M.base_30.pink },
    ["@keyword.function"] = { fg = "#d98bb3" },
    ["@keyword.conditional"] = { fg = "#f06ba8" },
    ["@keyword.conditional.ternary"] = { fg = "#f06ba8" },
    ["@keyword.repeat"] = { fg = "#f06ba8" },
    ["@keyword.return"] = { fg = "#f06ba8" },
    ["@keyword.exception"] = { fg = "#f06ba8" },
    ["@keyword.import"] = { fg = "#e79ad9", link = "" },
    ["@keyword.storage"] = { fg = M.base_30.pink },
    ["@keyword.modifier"] = { fg = M.base_30.pink },
    ["@keyword.operator"] = { fg = M.base_30.pink },
    ["@keyword.directive"] = { fg = M.base_30.white },
    ["@keyword.directive.define"] = { fg = "#e79ad9" },

    ["@operator"] = { fg = M.base_30.orange },
    ["@constructor"] = { fg = M.base_30.purple },
    ["@type"] = { fg = M.base_30.purple },
    ["@type.builtin"] = { fg = M.base_30.pink, link = "" },
    ["@type.definition"] = { fg = M.base_30.purple },
    ["@attribute"] = { fg = M.base_30.purple },
    ["@label"] = { fg = M.base_30.purple },

    ["@tag"] = { fg = M.base_30.pink },
    ["@tag.builtin"] = { fg = M.base_30.pink },
    ["@tag.attribute"] = { fg = M.base_30.purple, link = "" },
    ["@tag.delimiter"] = { fg = M.base_30.grey_fg2 },

    ["@punctuation.bracket"] = { fg = M.base_30.grey_fg2 },
    ["@punctuation.delimiter"] = { fg = "#707070" },
    ["@punctuation.special"] = { fg = M.base_30.cyan },

    ["@string"] = { fg = M.base_30.green },
    ["@string.escape"] = { fg = M.base_30.cyan },
    ["@string.regexp"] = { fg = M.base_30.cyan },
    ["@string.special"] = { fg = M.base_30.green },
    ["@string.special.symbol"] = { fg = M.base_30.green },
    ["@symbol"] = { fg = M.base_30.green },

    ["@comment"] = { fg = M.base_30.grey_fg },

    ["@markup.heading"] = { fg = M.base_30.pink, bold = true },
    ["@markup.raw"] = { fg = M.base_30.green },
    ["@markup.link"] = { fg = M.base_30.cyan, italic = true },
    ["@markup.link.url"] = { fg = M.base_30.green, underline = true },
    ["@markup.link.label"] = { fg = M.base_30.cyan },
    ["@markup.list"] = { fg = M.base_30.pink },
    ["@markup.italic"] = { fg = M.base_30.green, italic = true },
    ["@markup.strong"] = { fg = M.base_30.pink, bold = true },
    ["@markup.quote"] = { bg = M.base_30.one_bg },

    ["@diff.plus"] = { fg = "#4fd6be" },
    ["@diff.minus"] = { fg = "#c53b53" },
    ["@diff.delta"] = { fg = "#e5c07b" },
  },

  lsp = {
    DiagnosticError = { fg = "#e06c75" },
    DiagnosticWarn = { fg = "#f5a742" },
    DiagnosticInfo = { fg = "#56b6c2" },
    DiagnosticHint = { fg = "#787f8a" },
    DiagnosticUnnecessary = { fg = "#606060" },
    LspInlayHint = { fg = "#787f8a", bg = M.base_30.black2 },
    LspReferenceText = { bg = M.base_30.one_bg3 },
    LspReferenceRead = { bg = M.base_30.one_bg3 },
    LspReferenceWrite = { bg = M.base_30.one_bg3 },
  },

  telescope = {
    TelescopeMatching = { fg = M.base_30.orange, bold = true },
    TelescopeSelection = { bg = M.base_30.one_bg2, fg = M.base_30.white },
  },

  cmp = {
    CmpItemAbbrMatch = { fg = M.base_30.orange, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = M.base_30.orange },
    CmpSel = { bg = M.base_30.one_bg2, link = "" },
  },

  git = {
    diffAdded = { fg = "#4fd6be" },
    diffRemoved = { fg = "#c53b53" },
    diffChanged = { fg = "#e5c07b" },
  },
}

local StTheme = require("nvconfig").ui.statusline.theme

if StTheme == "vscode" or StTheme == "vscode_colored" then
  M.base_30.one_bg3 = M.base_30.line
end

M.type = "dark"

M = require("base46").override_theme(M, "opencode")

return M
