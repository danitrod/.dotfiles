local dracula = require("dracula")
dracula.setup()

vim.cmd [[colorscheme dracula]]

require('lualine').setup { theme = 'dracula' }
require("bufferline").setup {}
require("nvim-web-devicons").setup {}

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require("nvim-tree").setup({
	view = {
		side = "right",
		adaptive_size = true,
	},
	sort_by = "case_sensitive",
	renderer = {
		group_empty = true,
		icons = {
			git_placement = "after",
		},
	},
	filters = {
		dotfiles = false,
	},
	git = {
		ignore = false,
	},
})

require 'marks'.setup {
	sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
	bookmark_0 = {
		sign = "⚑",
		annotate = true,
	},
	bookmark_1 = {
		sign = "☑️",
		virt_text = "TODO",
		annotate = false,
	},
	bookmark_2 = {
		sign = "🔴",
		virt_text = "FIXME",
		annotate = false,
	},
	bookmark_3 = {
		sign = "⚠️",
		virt_text = "NOTE",
	},
	bookmark_4 = {
		sign = "💥",
		virt_text = "WARNING",
	},
	mappings = {}
}
