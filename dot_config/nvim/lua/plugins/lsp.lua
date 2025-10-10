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
        robotframework_ls = {
          cmd = { vim.fn.expand("~") .. "/Dev/posti-api/posti-api-hub-testing/.venv/bin/robotframework_ls" },
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
        robot = { "robocop" },
        http = {},
        rest = {},
      },
      formatters = {
        prettier = {
          prepend_args = { "--single-quote" },
        },
        robocop = {
          command = "robocop",
          args = function(self, ctx)
            return { "format", "--overwrite", "$FILENAME" }
          end,
          stdin = false,
        },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        robot = { "robocop" },
      },
      linters = {
        robocop = {
          cmd = "robocop",
          stdin = false,
          args = { "check" },
          stream = "stdout",
          parser = require("lint.parser").from_errorformat("%f:%l:%c %t%*[^:]: %m", { source = "robocop" }),
          ignore_exitcode = true,
        },
      },
    },
  },
}
