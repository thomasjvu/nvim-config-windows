local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()
-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

