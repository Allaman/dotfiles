local map = vim.api.nvim_set_keymap

-- map the leader key
-- map('n', '<Space>', '', {})
vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", { noremap = true, silent = true })
vim.g.mapleader = " " -- 'vim.g' sets global variables

options = { noremap = true }
map('n', '<C-p>', "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'fd', '--type', 'file', '--follow'}})<cr>", options)
map('n', '<Leader>r', '<cmd>Reload<cr>', options)
map('n', '<Leader>fr', '<cmd>Telescope oldfiles<cr>', options)
map('n', '<Leader>rg', '<cmd>Telescope live_grep<cr>', options)
-- center search results
map('n', 'n', 'nzz', options)
map('n', 'N', 'Nzz', options)

-- better indenting
map("v", "<", "<gv", { noremap = true, silent = true })
map("v", ">", ">gv", { noremap = true, silent = true })
-- paste over currently selected text without yanking it
map('v', 'p', '"_dP', { noremap = true, silent = true })

-- tmux navigation
map('n', "<C-h>", "<cmd>lua require('Navigator').left()<CR>", options)
map('n', "<C-k>", "<cmd>lua require('Navigator').up()<CR>", options)
map('n', "<C-l>", "<cmd>lua require('Navigator').right()<CR>", options)
map('n', "<C-j>", "<cmd>lua require('Navigator').down()<CR>", options)

-- neovim-tree
map('n', '<Leader>t', ':NvimTreeToggle<CR>', options)
map('n', '<Leader>tf', ':NvimTreeFindFile<CR>', options)
