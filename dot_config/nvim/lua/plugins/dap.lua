return {
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "mfussenegger/nvim-dap-python",
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/cmp-dap",
    },
    config = function(_, opts)
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup(opts)
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open({})
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close({})
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close({})
      end
      table.insert(require("dap").configurations, {
        python = {
          type = "python",
          request = "attach",
          name = "Attach remote (with path mapping)",
          connect = function()
            local host = vim.fn.input("Host [127.0.0.1]: ")
            host = host ~= "" and host or "127.0.0.1"
            local port = tonumber(vim.fn.input("Port [5678]: ")) or 5678
            return { host = host, port = port }
          end,
          pathMappings = function()
            local cwd = "${workspaceFolder}"
            local local_path = vim.fn.input("Local path mapping [" .. cwd .. "]: ")
            local_path = local_path ~= "" and local_path or cwd
            local remote_path = vim.fn.input("Remote path mapping [.]: ")
            remote_path = remote_path ~= "" and remote_path or "."
            return { { localRoot = local_path, remoteRoot = remote_path } }
          end,
        },
      })
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function() end,
  },
}
