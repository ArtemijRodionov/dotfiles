return {
	"mbbill/undotree",
	config = function()
		vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { silent = true, noremap = true, desc = "Undo tree" })
	end
}
