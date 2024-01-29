local function key_opts(desc)
    return { desc = desc, noremap = true, silent = true }
    -- return {}
end

return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, key_opts("Find files"))
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep >") })
        end, key_opts("Grep files"))
        vim.keymap.set('n', '<C-p>', function()
            builtin.git_files({ cwd = vim.fn.getcwd(), git_command = "arc", use_file_path = true })
        end, key_opts("Git files"))

        vim.keymap.set("n", "gd", builtin.lsp_definitions, key_opts("Definitions"))
        vim.keymap.set("n", "<leader>lD", builtin.diagnostics, key_opts("Diagnostics"))
        vim.keymap.set("n", "<leader>lR", builtin.lsp_references, key_opts("References"))
        vim.keymap.set("n", "<leader>li", builtin.lsp_implementations, key_opts("Implementations"))
        vim.keymap.set("n", "<leader>pw", builtin.lsp_workspace_symbols, key_opts("Symbols"))
    end,
}
