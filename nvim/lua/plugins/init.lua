return {
  {
    "stevearc/conform.nvim",
    config = function()
      require "configs.conform"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    init = function()
      local query = require "vim.treesitter.query"

      local legacy = {
        ["nth?"] = true,
        ["is?"] = true,
        ["kind-eq?"] = true,
        ["set-lang-from-mimetype!"] = true,
        ["set-lang-from-info-string!"] = true,
        ["downcase!"] = true,
      }

      local function first_node_per_capture(match)
        local flat = {}

        for id, nodes in pairs(match) do
          flat[id] = type(nodes) == "table" and nodes[1] or nodes
        end

        return flat
      end

      for _, add in ipairs { "add_predicate", "add_directive" } do
        local original_add = query[add]

        query[add] = function(name, handler, opts)
          if legacy[name] then
            local original_handler = handler

            handler = function(match, ...)
              return original_handler(first_node_per_capture(match), ...)
            end
          end

          return original_add(name, handler, opts)
        end
      end
    end,
    opts = {
      ensure_installed = {
        -- defaults
        "vim",
        "lua",
        "vimdoc",
        "make",
        "bash",
        "luadoc",
        "markdown",
        "markdown_inline",

        -- web dev
        "html",
        "css",
        "javascript",
        "typescript",
        "prisma",

        -- some languages
        "dart",
        "java",
        "php",
        "python",
        "json",
        "yaml",
        "toml",
        "graphql",

        -- low level
        "c",
        "cpp",
        "zig",
        "rust",
        "go",
      },
    },
  },
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()',
  },
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "Trouble" },
    config = function()
      require("trouble").setup()
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = {
      git = {
        enable = false,
      },
    },
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    cmd = {
      "Neotree",
    },
    config = function()
      require("neo-tree").setup {
        close_if_last_window = true,
        popup_border_style = "solid",
        enable_modified_markers = true,
        enable_diagnostics = true,
        sort_case_insensitive = true,
        enable_git_status = false,
        default_component_configs = {
          indent = {
            with_markers = true,
            with_expanders = true,
          },
          modified = {
            symbol = " ",
            highlight = "NeoTreeModified",
          },
          icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "",
            folder_empty_open = "",
          },
          git_status = {
            symbols = {
              added = "",
              deleted = "",
              modified = "",
              renamed = "",
              untracked = "",
              ignored = "",
              unstaged = "",
              staged = "",
              conflict = "",
            },
          },
        },
        window = {
          position = "float",
          width = 40,
        },
        filesystem = {
          use_libuv_file_watcher = true,
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_by_name = {
              "node_modules",
              ".git",
              ".vscode",
              ".intellij",
            },
            never_show = {
              ".DS_Store",
              "thumbs.db",
              "desktop.ini",
              "*.wt"
            },
          },
        },
        event_handlers = {
          {
            event = "neo_tree_window_after_open",
            handler = function(args)
              if args.position == "left" or args.position == "right" then
                vim.cmd "wincmd ="
              end
            end,
          },
          {
            event = "neo_tree_window_after_close",
            handler = function(args)
              if args.position == "left" or args.position == "right" then
                vim.cmd "wincmd ="
              end
            end,
          },
        },
      }
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      enabled = false,
    },
  },
  {
    "terrortylor/nvim-comment",
    cmd = {
      "CommentToggle",
    },
    config = function()
      require("nvim_comment").setup()
    end,
  },
  {
    "razak17/tailwind-fold.nvim",
    cmd = {
      "TailwindFoldToggle",
      "TailwindFoldEnable",
      "TailwindFoldDisable",
    },
    opts = {
      enabled = true,
      symbol = "󱏿",
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = { "html", "svelte", "astro", "vue", "typescriptreact", "php", "blade" },
  },
  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim",
      "neovim/nvim-lspconfig",
    },
    cmd = {
      "TailwindConcealEnable",
      "TailwindConcealDisable",
      "TailwindConcealToggle",
      "TailwindColorEnable",
      "TailwindColorDisable",
      "TailwindColorToggle",
      "TailwindSort",
      "TailwindSortSelection",
      "TailwindNextClass",
      "TailwindSortSelection",
    },
    config = function()
      require("tailwind-tools").setup()
    end,
  },
  {
    "folke/zen-mode.nvim",
    cmd = {
      "ZenMode",
    },
    config = function()
      require("zen-mode").setup {
        window = {
          backdrop = 0.95,
          width = 120,
          height = 1,
          options = {
            number = true,
          },
        },
      }
    end,
  },
}
