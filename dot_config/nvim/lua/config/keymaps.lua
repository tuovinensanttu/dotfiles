-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

-- Keep focus in the middle with page up and down
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "{", "{zz")
keymap.set("n", "}", "}zz")
keymap.set("n", "n", "nzz")
keymap.set("n", "N", "Nzz")

-- Move line with J and K
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '>-2<CR>gv=gv")

-- Disable swap lines in normal + insert modes
keymap.set({ "n", "i" }, "<A-j>", "<nop>")
keymap.set({ "n", "i" }, "<A-k>", "<nop>")

-- Paste without copying the value
keymap.set("x", "<leader>p", [["_dP]])

-- Open oil.nvim file browser
-- keymap.set("n", "<leader>e", ":Oil --float lua vim.getcwd()<CR>")
keymap.set("n", "<leader>E", function()
  local oil = require("oil")
  oil.toggle_float(vim.fn.getcwd())
end)

keymap.set("n", "<leader>e", function()
  local oil = require("oil")
  oil.toggle_float()
end)

-- Harpoon
local harpoon = require("harpoon")
keymap.set("n", "<C-e>", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

keymap.set("n", "<leader>a", function()
  harpoon:list():add()
end)

keymap.set("n", "<leader>1", function()
  harpoon:list():select(1)
end)

keymap.set("n", "<leader>2", function()
  harpoon:list():select(2)
end)

keymap.set("n", "<leader>3", function()
  harpoon:list():select(3)
end)

keymap.set("n", "<leader>4", function()
  harpoon:list():select(4)
end)

keymap.set("n", "<leader>5", function()
  harpoon:list():select(5)
end)
