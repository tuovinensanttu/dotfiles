local function search_all_http_requests()
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local conf = require("telescope.config").values
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")
  local previewers = require("telescope.previewers")

  -- Find all .http files in the project
  local exclude_dirs = { ".venv", "venv", "cdk.out", "layer", "layers", "node_modules", ".approval_tests_temp", ".git" }

  local find_cmd
  if vim.fn.executable("rg") == 1 then
    local rg_excludes = ""
    for _, dir in ipairs(exclude_dirs) do
      rg_excludes = rg_excludes .. " --glob '!" .. dir .. "/**'"
    end
    find_cmd = "rg --files" .. rg_excludes .. " --glob '*.http' 2>/dev/null"
  else
    local find_excludes = ""
    for _, dir in ipairs(exclude_dirs) do
      find_excludes = find_excludes .. " -path '*/" .. dir .. "' -prune -o"
    end
    find_cmd = "find ." .. find_excludes .. " -type f -name '*.http' -print 2>/dev/null"
  end

  local http_files = vim.fn.systemlist(find_cmd)

  local function parse_file(file)
    local requests = {}
    local lines = vim.fn.readfile(file)
    local current_request = nil

    for i, line in ipairs(lines) do
      -- Look for HTTP method lines (GET, POST, PUT, DELETE, etc.)
      local method, url = line:match("^(%u+)%s+(.+)")
      if method then
        current_request = {
          file = file,
          line = i,
          method = method,
          url = url,
          display = string.format("[%s] %s %s (%s:%d)", vim.fn.fnamemodify(file, ":t"), method, url, file, i),
        }
        table.insert(requests, current_request)
      -- Also capture request names if they exist (lines starting with ###)
      elseif line:match("^###%s+(.+)") and current_request then
        local name = line:match("^###%s+(.+)")
        current_request.name = name
        current_request.display = string.format(
          "[%s] %s - %s %s (%s:%d)",
          vim.fn.fnamemodify(file, ":t"),
          name,
          current_request.method,
          current_request.url,
          file,
          i
        )
      end
    end
    return requests
  end

  local all_requests = {}
  for _, file in ipairs(http_files) do
    local file_requests = parse_file(file)
    for _, req in ipairs(file_requests) do
      table.insert(all_requests, req)
    end
  end

  pickers
    .new({}, {
      prompt_title = "HTTP Requests (Project-wide)",
      finder = finders.new_table({
        results = all_requests,
        entry_maker = function(entry)
          return {
            value = entry,
            display = entry.display,
            ordinal = entry.display,
          }
        end,
      }),
      sorter = conf.generic_sorter({}),
      previewer = previewers.new_buffer_previewer({
        define_preview = function(self, entry)
          local lines = vim.fn.readfile(entry.value.file)
          vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, lines)
          vim.api.nvim_set_option_value("filetype", "http", { buf = self.state.bufnr })

          local ns = vim.api.nvim_create_namespace("kulala_preview_highlight")
          vim.api.nvim_buf_set_extmark(self.state.bufnr, ns, entry.value.line - 1, 0, {
            end_line = entry.value.line - 1,
            end_col = #lines[entry.value.line],
            hl_group = "TelescopePreviewLine",
          })
        end,
      }),
      attach_mappings = function(prompt_bufnr, map)
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          local selection = action_state.get_selected_entry()
          vim.cmd("edit " .. selection.value.file)
          vim.api.nvim_win_set_cursor(0, { selection.value.line, 0 })
        end)

        map("i", "<C-j>", actions.move_selection_next)
        map("i", "<C-k>", actions.move_selection_previous)
        return true
      end,
    })
    :find()
end

return {
  "mistweaverco/kulala.nvim",
  ft = { "http", "rest" },
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    { "<leader>rr", "<cmd>lua require('kulala').run()<cr>", desc = "Send request" },
    { "<leader>rl", "<cmd>lua require('kulala').run_last()<cr>", desc = "Run last request" },
    { "<leader>ra", "<cmd>lua require('kulala').run_all()<cr>", desc = "Send all requests" },
    { "<leader>rc", "<cmd>lua require('kulala').copy()<cr>", desc = "Copy as cURL" },
    { "<leader>ri", "<cmd>lua require('kulala').inspect()<cr>", desc = "Inspect request" },
    { "<leader>rt", "<cmd>lua require('kulala').toggle_view()<cr>", desc = "Toggle headers/body" },
    { "<leader>re", search_all_http_requests, desc = "Search all requests" },
    { "<leader>rs", "<cmd>lua require('kulala').set_selected_env()<cr>", desc = "Select environment" },
  },
  opts = {},
}
