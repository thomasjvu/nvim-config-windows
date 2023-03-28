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

    use('theprimeagen/harpoon')

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
    use({
        'projekt0n/github-nvim-theme',
        tag = 'v0.0.7',
        -- or                            branch = '0.0.x'
        config = function()
            require('github-theme').setup({
                theme_style = "dark",
                function_style = "NONE",
                colors = {hint = "orange", error = "#ff2147"},
                transparent = true,
                dark_sidebar = true,
                dark_float = true,
                comment_style = "italic",
                keyword_style = "NONE",
                variable_style = "NONE"
            })
        end
    })

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

    -- Markdown
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    -- Movement

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

    -- Language Server
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    }

    -- File Size
    -- use('barrett-ruth/import-cost.nvim')
    -- use('yardnsm/vim-import-cost')


    -- Style
    use {
        "startup-nvim/startup.nvim",
        config = function()
            require("startup").setup { theme = "ultima" }
        end,
    }

    use('nvim-lualine/lualine.nvim')

    -- Extras
    use('eandrju/cellular-automaton.nvim')
    -- use({ "echasnovski/mini.animate", branch = "stable" })
    -- use('Exafunction/codeium.vim')

end)
