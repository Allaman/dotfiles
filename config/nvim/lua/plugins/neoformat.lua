local g = vim.g

g.neoformat_run_all_formatters = 0
g.neoformat_enabled_python = { "autopep8", "yapf", "docformatter" }
g.neoformat_enabled_javascript = { "prettier" }
--       autocmd BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
      -- autocmd BufWritePre * undojoin | Neoformat
vim.api.nvim_exec(
  [[
    augroup fmt
      autocmd!
      autocmd BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
    augroup END
  ]],
  false
)
