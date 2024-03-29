local prettier = require("prettier")

prettier.setup({
    bin = 'prettier', -- or `'prettierd'` (v0.22+)
    filetypes = {
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "less",
        "markdown",
        "scss",
        "typescript",
        "typescriptreact",
        "vue",
        "yaml",
    },
    cli_options = {
        tab_width = 4,
        print_width = 120,
        vue_indent_script_and_style = false,
        bracket_same_line = true
    }
})
