local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript | javascript | vue
lspconfig.ts_ls.setup {
  -- on_init = on_init,
  -- capabilities = capabilities,
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vim.fn.expand("~/.nvm/versions/node/v22.8.0/lib/node_modules/@vue/language-server"),
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
}

-- tailwindcss
lspconfig.tailwindcss.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- python
lspconfig.pyright.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- dart
lspconfig.dartls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- cpp | c
lspconfig.clangd.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}
-- go
lspconfig.gopls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- java
lspconfig.jdtls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- vue
require 'lspconfig'.volar.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- groovy
lspconfig.groovyls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- eslint
lspconfig.eslint.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  root_dir = require("lspconfig").util.root_pattern("eslint.config.js", ".eslintrc.js", ".eslintrc.json", ".eslintrc", "eslint.config.mjs"),
}

-- json | jsonc
lspconfig.jsonls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- yaml
lspconfig.yamlls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- docker
lspconfig.dockerls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- docker compose
lspconfig.docker_compose_language_service.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- graphql
lspconfig.graphql.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- bash
lspconfig.bashls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- prismals
lspconfig.prismals.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}
