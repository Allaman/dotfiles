-- Prettier settings for Neoformat
-- vim.api.nvim_exec(
--   [[
--   augroup Neoformat
--     au!
--     autocmd BufWritePre * :%s/\s\+$//e
--     autocmd FileType yaml setlocal formatprg=prettier --single-quote\ --trailing-comma\ es5
--   augroup END
--   ]],
--   false
-- )
vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2

