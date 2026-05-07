vim.opt.relativenumber = true
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.termguicolors = true
vim.opt.signcolumn = 'yes'
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.laststatus = 0

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.pack.add({
	
        { src = "https://github.com/blazkowolf/gruber-darker.nvim" },
		{ src = "https://github.com/nvim-mini/mini.nvim"},
		{ src = "https://github.com/stevearc/oil.nvim"},
		{ src = "https://github.com/numtostr/comment.nvim"},

})

require("oil").setup({
	columns = {
		"permissions",
		"icons"
	},
	view_options = {
		show_hidden = true
	}
})



require("gruber-darker").setup({
	priority = 1000,
	opts = {
		bold = false,
		italic = {
			strings = false,
		},
	},
})

vim.cmd.colorscheme("gruber-darker")

local function no_italic(group)
	local hl =  vim.api.nvim_get_hl(0, { name = group, link = false})
	hl.italic = false
	vim.api.nvim_set_hl(0, group, hl)
end

no_italic("@string")
no_italic("@string.documentation")
no_italic("@string.comment")
no_italic("String")


require("mini.pick").setup()
require("mini.pairs").setup()
require("mini.surround").setup()


vim.keymap.set("n", "<leader>e", ":Oil<CR>")
vim.keymap.set("n", "<leader>f", ":Pick files<CR>")
vim.keymap.set("n", "<leader>h", ":Pick help<CR>")
vim.keymap.set("n", "<leader>g", ":Pick grep_live<CR>")
vim.keymap.set("n", "<leader>b", ":Pick buffers<CR>")
