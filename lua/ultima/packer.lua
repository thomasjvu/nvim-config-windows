-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- File Browsing
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }

    -- Zen Mode
    use({
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup({
            })
        end,
    })

    use({
        "folke/twilight.nvim",
        config = function()
            require("twilight").setup({
            })
        end,
    })

    -- Themes
    use('ackyshake/Spacegray.vim')

    -- Formatting
    use('mattn/emmet-vim')
    use('neovim/nvim-lspconfig')
    use('jose-elias-alvarez/null-ls.nvim')
    use('MunifTanjim/prettier.nvim')

    use {
        "windwp/nvim-ts-autotag"
    }
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- TreeSitter
    use({ 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } })
    -- use({'nvim-treesitter/playground'})
    -- use('MDeiml/tree-sitter-markdown')

    -- Markdown
    -- install without yarn or npm
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    -- Movement
    use('theprimeagen/harpoon')

    -- Git
    -- use('mbbill/undotree')
    use('tpope/vim-fugitive')

    -- Terminal
    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end }

    -- Comments
    use('tpope/vim-commentary')
    use('JoosepAlviste/nvim-ts-context-commentstring')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },           -- Required
            { 'williamboman/mason.nvim' },         -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },       -- Required
            { 'hrsh7th/cmp-nvim-lsp' },   -- Required
            { 'hrsh7th/cmp-buffer' },     -- Optional
            { 'hrsh7th/cmp-path' },       -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },   -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },           -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    }


    -- Style
    use {
        "startup-nvim/startup.nvim",
        config = function()
            require("startup").setup { theme = "ultima" }
        end,
    }

    use('nvim-lualine/lualine.nvim')

    -- use({ "echasnovski/mini.animate", branch = "stable" })

    -- use('Exafunction/codeium.vim')
end)
