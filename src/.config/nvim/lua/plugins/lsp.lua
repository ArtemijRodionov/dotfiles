local function opts(desc, given)
    local result = { remap = false, desc = desc, silent = true }
    if opts ~= nil then
        for k, v in pairs(given) do
            result[k] = v
        end
    end
    return result
end

return {
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },
        init = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()
            lsp_zero.on_attach(function(client, bufnr)
                local default = { buffer = bufnr }
                vim.keymap.set("n", "<leader>lk", function() vim.lsp.buf.hover() end, opts("Hover", default))
                vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format() end, opts("Format", default))
                vim.keymap.set("n", "<leader>lc", function() vim.lsp.buf.code_action() end, opts("Action", default))
                vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end, opts("Rename", default))
                vim.keymap.set("n", "<leader>lh", function() vim.lsp.buf.signature_help() end, opts("Help", default))
                vim.keymap.set("n", "<leader>ld", function() vim.diagnostic.open_float() end, opts("Diagnostic", default))
                vim.keymap.set("n", "[d", function() vim.lsp.diagnostic.goto_next() end, opts("Next diagnostic", default))
                vim.keymap.set("n", "]d", function() vim.lsp.diagnostic.goto_prev() end, opts("Prv diagnostic", default))
            end)

            require('mason').setup({})
            require('mason-lspconfig').setup({
                handlers = {
                    lsp_zero.default_setup,
                    gopls = function()
                        require('lspconfig').gopls.setup({})
                        -- "CGO_ENABLED": "0",
                        -- "GOFLAGS": "-mod=vendor",
                        -- "GOPRIVATE": "*.y-t.ru,*.yc.net"
                    end
                },
            })
        end,
    },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip' },
}
