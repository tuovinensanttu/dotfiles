-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc" },
  callback = function()
    vim.wo.spell = false
    vim.wo.conceallevel = 0
  end,
})

-- Disable black formatting for .approved. files
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.approved.*",
  callback = function()
    vim.b.autoformat = false
  end,
})
