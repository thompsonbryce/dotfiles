return {
    {
        "neovim/nvim-lspconfig",
        on_attach = function()
            vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
        end
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "mason.nvim" },
        config = function()
            require("mason-lspconfig").setup()
            require("mason-lspconfig").setup_handlers({
                function (server_name)
                    require("lspconfig")[server_name].setup({})
                end,
            })
        end
    }
}
