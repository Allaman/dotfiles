vim.api.nvim_command('set foldmethod=expr')
vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "bash", "dockerfile", "go", "hcl", "html", "java", "javascript", "json", "lua", "python", "toml", "yaml"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { }, -- List of parsers to ignore installing
  highlight = {
    enable = true,  -- false will disable the whole extension
    disable = { },  -- list of language that will be disabled
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<Leader>v",
      node_incremental = "vi",
      -- scope_incremental = "<Leader>v",
      node_decremental = "vd",
    },
  },
  indent = {
    enable = true
  }
}
