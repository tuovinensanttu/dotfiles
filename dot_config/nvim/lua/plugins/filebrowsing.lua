return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },
  {
    "stevearc/oil.nvim",
    opts = {
      keymaps = {
        ["<bs>"] = "actions.parent",
        ["<leader>e"] = "actions.close",
        ["q"] = "actions.close",
        ["<S-h>"] = "actions.toggle_hidden",
      },
      float = {
        padding = 10,
        max_width = 0,
        max_height = 0,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
      },
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
}
