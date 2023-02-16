local dracula = require("dracula")
dracula.setup()

vim.cmd [[colorscheme dracula]]

require('lualine').setup { theme = 'dracula' }
require("nvim-tree").setup({
	view = {
		side = "right",
		adaptive_size = true
	},
	renderer = {
		icons = {
			git_placement = "after"
		}
	}
})
require("bufferline").setup {}
require("nvim-web-devicons").setup {}
