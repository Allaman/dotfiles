-- require'lspconfig'.gopls.setup{
--   cmd = {"gopls","--remote=auto"},
--   -- on_attach = require("lsp").common_on_attach,
--   -- capabilities = vim.lsp.protocol.make_client_capabilities(),
--   init_options = {
--     usePlaceholders=true,
--     completeUnimported=true,
--   },
--   settings = { gopls = { analyses = { unusedparams = false }, staticcheck = true } },
-- }

vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4

