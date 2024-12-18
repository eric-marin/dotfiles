-- define common options
local keymap = vim.keymap
local opts = {
  noremap = true, -- non-recursive
  silent = true,  -- do not show message
}

-- Pane Navigation
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Window Resize
keymap.set("n", "<C-Up>", ":resize -2<Enter>", opts)
keymap.set("n", "<C-Down>", ":resize +2<Enter>", opts)
keymap.set("n", "<C-Left>", ":vertical resize -2<Enter>", opts)
keymap.set("n", "<C-Right>", ":vertical resize +2<Enter>", opts)

-- Window Managment
keymap.set("n", "<Space>sv", ":vsplit<Enter>", opts)
keymap.set("n", "<Space>sh", ":split<Enter>", opts)

-- Indending
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Comments
vim.api.nvim_set_keymap("n", "<C-c>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-c>", "gcc<Esc>", { noremap = false })

-- Buffer kill
-- keymap.set("n", "<C-q>", ":bunload<Enter>", opts)

-- Working
keymap.set("n", "<C-s>", ":w<Enter>", opts)
