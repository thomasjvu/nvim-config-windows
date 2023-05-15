local cmp = require('cmp')
local lsp_zero = require('lsp-zero')

-- Setup `lsp-zero`
lsp_zero.preset('recommended')
lsp_zero.setup()

require('cmp_nvim_lsp').setup() -- Add this line

-- Add `lsp_zero` source to `nvim-cmp` with custom `item_kind`
cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'lsp_zero', kind = 'Function Signature (Default Parameters)', option = { menu = '[LSP-Zero]' } },
    { name = 'luasnip'},
  },
  mapping = {
    -- Automatically insert function signature
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    }),
    -- Ctrl+Space to trigger completion menu
    ["<C-Space>"] = cmp.mapping.complete(),
    -- Ctrl+e to close completion menu
    ["<C-e>"] = cmp.mapping.close(),
  },
  completion = {
    keyword_length = 0, -- Minimum word length before showing results
  },
})
