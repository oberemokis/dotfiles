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
