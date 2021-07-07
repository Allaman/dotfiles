vim.api.nvim_exec(
  [[
  augroup Programming
    au!
    au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    au FileType json setlocal ts=4 sts=4 sw=4 foldmethod=syntax expandtab
    au FileType yaml,yml setlocal ts=2 sts=2 sw=2 foldmethod=indent expandtab
    au FileType javascript setlocal shiftwidth=4 tabstop=4
  augroup END
  ]],
  false
)
vim.api.nvim_exec(
  [[
  augroup Commenting
    au!
    au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  augroup END
  ]],
  false
)
