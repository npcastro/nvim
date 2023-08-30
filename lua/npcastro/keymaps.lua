--Remap space as leader key
vim.keymap.set("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Resize with arrows
vim.keymap.set("n", "<M-Up>", ":resize +2<CR>")
vim.keymap.set("n", "<M-Down>", ":resize -2<CR>")
vim.keymap.set("n", "<M-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<M-Right>", ":vertical resize +2<CR>")

-- Buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>")        -- change to next buffer
vim.keymap.set("n", "<S-h>", ":bprevious<CR>")    -- change to previos buffer
vim.keymap.set("n", "<leader>q", ":Bd<CR>")       -- close buffer without messing window layout
vim.keymap.set("n", "<leader>Q", ":bufdo :Bd<CR>")       -- close all buffers without messing window layout

-- Visual --
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Move text up and down
vim.keymap.set("v", "p", '"_dP')  -- allows to paste multiple times tanked text

-- Visual Block --
-- Move text up and down
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv")
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv")

-- find and replace selection
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
