return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "debugpy",
        "stylua",
        "shellcheck",
        "css-lsp",
        "vue-language-server",
      })
      opts.PATH = "append"
    end,
  },
  -- Disable default <tab> and <s-tab> behavior in LuaSnip
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        ["<C-j>"] = { "select_next" },
        ["<C-k>"] = { "select_prev" },
        ["<C-y>"] = {},
      },
      completion = {
        list = {
          selection = { preselect = false },
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {
          implicitProjectConfiguration = {
            checkJs = true,
            importModuleSpecifierPreference = "non-relative",
          },
        },
        pyright = {
          cmd = { "pyright-langserver", "--stdio", "--max-old-space-size=8192" },
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true,
                exclude = {
                  "**/cdk.out/**",
                  "**/node_modules/**",
                  "**/__pycache__/**",
                  "**/dist/**",
                  "**/build/**",
                  "**/.git/**",
                  "**/site-packages/**",
                  "**/.aws-sam/**",
                },
              },
            },
          },
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "black", "isort" },
        yaml = { "prettier" },
      },
      formatters = {
        prettier = {
          prepend_args = { "--single-quote" },
        },
      },
    },
  },
}
