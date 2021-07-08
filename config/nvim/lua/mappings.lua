local map = vim.api.nvim_set_keymap

-- map the leader key
vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", { noremap = true, silent = true })
vim.g.mapleader = " " -- 'vim.g' sets global variables

options = { noremap = true }
-- center search results
map('n', 'n', 'nzz', options)
map('n', 'N', 'Nzz', options)

-- better indenting
map("v", "<", "<gv", { noremap = true, silent = true })
map("v", ">", ">gv", { noremap = true, silent = true })
-- paste over currently selected text without yanking it
map('v', 'p', '"_dP', { noremap = true, silent = true })

-- Tab switch buffer
map("n", "<TAB>", ":bnext<CR>", { noremap = true, silent = true })
map("n", "<S-TAB>", ":bprevious<CR>", { noremap = true, silent = true })

-- Change behaviour of Y similar to C and D
map("n", "Y", "y$", options)

-- Cancel search highlighting with ESC
map("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", options)

-- previously opened buffer
map("n", "<Leader><TAB>", ":e#<CR>", options)

-- Resizing panes
map("n", "<Left>", ":vertical resize +1<CR>", options)
map("n", "<Right>", ":vertical resize -1<CR>", options)
map("n", "<Up>", ":resize -1<CR>", options)
map("n", "<Down>", ":resize +1<CR>", options)
