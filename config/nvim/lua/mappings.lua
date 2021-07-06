local map = vim.api.nvim_set_keymap

-- map the leader key
-- map('n', '<Space>', '', {})
vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", { noremap = true, silent = true })
vim.g.mapleader = " " -- 'vim.g' sets global variables

options = { noremap = true }
map('n', '<C-p>', "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'fd','--follow'}})<cr>", options)
map('n', '<Leader>r', '<cmd>Reload<cr>', options)
map('n', '<Leader>fr', '<cmd>Telescope oldfiles<cr>', options)
map('n', '<Leader>rg', '<cmd>Telescope live_grep<cr>', options)

-- better indenting
map("v", "<", "<gv", { noremap = true, silent = true })
map("v", ">", ">gv", { noremap = true, silent = true })
