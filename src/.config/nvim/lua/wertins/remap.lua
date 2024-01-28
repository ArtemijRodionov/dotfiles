local function opts(desc)
    return { silent = true, noremap = true, desc = desc }
end

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, opts("Project Ex"))
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts("Move selected Up"))
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts("Move selected Down"))
vim.keymap.set("n", "J", "mzJ`z", opts("Join lines"))
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts("Scroll down"))
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts("Scroll up"))
vim.keymap.set("n", "n", "nzzzv", opts("Search next"))
vim.keymap.set("n", "N", "Nzzzv", opts("Search prev"))

-- keep buffer clean
vim.keymap.set("x", "<leader>p", "\"_dP", opts("Paste replace"))
vim.keymap.set("n", "<leader>d", "\"_d", opts("Delete line"))
vim.keymap.set("v", "<leader>d", "\"_d", opts("Delete line"))
-- copy to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y", opts("Copy to clipboard"))
vim.keymap.set("v", "<leader>y", "\"+y", opts("Copy to clipboard"))
vim.keymap.set("n", "<leader>Y", "\"+Y", opts("Copy to clipboard line"))

-- commands
vim.keymap.set("n", "<leader>pS", "<cmd>silent !tmux neww tmux-sessionizer<CR>", opts("Select project"))
vim.keymap.set("n", "<leader>cx", "<cmd>!chmod +x %<CR>", opts("Chmod +x"))

