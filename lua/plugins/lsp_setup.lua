return {
    {
        "mason-org/mason.nvim",
        opts = {},
    },

    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "lua_ls",
                "pyrefly",
            },
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.config("lua_ls", {})
            vim.lsp.config("pyrefly", {})

            vim.lsp.enable("lua_ls")
            vim.lsp.enable("pyrefly")
            vim.keymap.set('n', 'H', vim.lsp.buf.hover, {})
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
        end,
    },
}
