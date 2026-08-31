local servers = {
  html = {},
  cssls = {},
  tailwindcss = {},
  volar = {},
  jsonls = {},
  yamlls = {},
  graphql = {},
  prismals = {},
  bashls = {},
  dockerls = {},
  docker_compose_language_service = {},
  pyright = {},
  dartls = {},
  clangd = {},
  gopls = {},
  jdtls = {},
  groovyls = {},

  ts_ls = {
    init_options = {
      plugins = {
        {
          name = "@vue/typescript-plugin",
          location = vim.fn.expand "~/.nvm/versions/node/v22.8.0/lib/node_modules/@vue/language-server",
          languages = { "javascript", "typescript", "vue" },
        },
      },
    },
    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
      "vue",
    },
  },

  eslint = {
    root_dir = function(bufnr, on_dir)
      on_dir(vim.fs.root(bufnr, {
        "eslint.config.js",
        "eslint.config.mjs",
        ".eslintrc.js",
        ".eslintrc.json",
        ".eslintrc",
      }))
    end,
  },
}

for name, opts in pairs(servers) do
  vim.lsp.config(name, opts)
end

vim.lsp.enable(vim.tbl_keys(servers))

local signature_opts = {
  border = "rounded",
  focusable = false,
  silent = true,
  max_height = 7,
}

local function at_trigger_char(chars)
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  local prev_char = line:sub(col - 1, col - 1)
  local cur_char = line:sub(col, col)

  for _, char in ipairs(chars) do
    if cur_char == char or prev_char == char then
      return true
    end
  end

  return false
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("LspSignatureHelp", { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local provider = client and client.server_capabilities.signatureHelpProvider

    if not provider then
      return
    end

    vim.api.nvim_create_autocmd("TextChangedI", {
      buffer = args.buf,
      callback = function()
        if at_trigger_char(provider.triggerCharacters or {}) then
          vim.lsp.buf.signature_help(signature_opts)
        end
      end,
    })
  end,
})
