return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "debugpy",
        "stylua",
        "shellcheck",
        "css-lsp",
      })
      opts.PATH = "append"
    end,
  },
  {
    "nvim-cmp",
    opts = function(_, opts)
      table.insert(opts.sources, 1, {
        name = "copilot",
        group_index = 1,
        priority = 100,
      })
      local cmp_preselect_type = require("cmp.types").cmp.PreselectMode.None
      local cmp = require("cmp")
      opts.mapping = {
        ["<C-y>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        }),
      }
      opts.preselect = cmp_preselect_type
      opts.completion.completeopt = "menu,menuone,noselect"
    end,
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
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["python"] = { "black", "isort" },
      },
    },
  },
}
