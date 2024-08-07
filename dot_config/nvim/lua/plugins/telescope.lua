return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader>fh",
      function()
        require("telescope.builtin").find_files({
          no_ignore = true,
          hidden = true,
          additional_args = { "--hidden" },
        })
      end,
      desc = "Find hidden files",
    },
    {
      "<leader>fH",
      function()
        require("telescope.builtin").live_grep({
          no_ignore = true,
          hidden = true,
          additional_args = { "--hidden" },
        })
      end,
      desc = "Search hidden files",
    },
    {
      "<leader>bm",
      function()
        require("telescope").extensions.bookmarks.list()
      end,
    },
  },
  config = function(_, opts)
    require("telescope").load_extension("bookmarks")
    require("telescope").setup(opts)
  end,
  opts = {
    defaults = {
      layout_config = {
        prompt_position = "top",
      },
      sorting_strategy = "ascending",
    },
    pickers = {
      live_grep = {
        sort_lastused = true,
        mappings = {
          i = {
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
          },
        },
      },
      buffers = {
        sort_lastused = true,
        mappings = {
          i = {
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
          },
        },
      },
      find_files = {
        sort_lastused = true,
        mappings = {
          i = {
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
          },
        },
      },
      git_files = {
        sort_lastused = true,
        mappings = {
          i = {
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
          },
        },
      },
      lsp_document_symbols = {
        sort_lastused = true,
        mappings = {
          i = {
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
          },
        },
      },
      lsp_dynamic_workspace_symbols = {
        sort_lastused = true,
        mappings = {
          i = {
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
          },
        },
      },
    },
  },
}
