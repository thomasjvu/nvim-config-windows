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
  -- snippet = {
  --   expand = function(args)
  --     vim.fn["UltiSnips#Anon"](args.body)
  --   end,
  -- },
  --    enabled = function()
  --   local in_prompt = vim.api.nvim_buf_get_option(0, 'buftype') == 'prompt'
  --   if in_prompt then  -- this will disable cmp in the Telescope window (taken from the default config)
  --     return false
  --   end
  --   local context = require("cmp.config.context")
  --   return not(context.in_treesitter_capture("comment") == true or context.in_syntax_group("Comment"))
-- end
})

