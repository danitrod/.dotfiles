local dracula = require("dracula")
dracula.setup()

vim.cmd[[colorscheme dracula]]

require('lualine').setup { theme = 'dracula' }
require("nvim-tree").setup({
	view = {
		side = "right"
	}
})
require("bufferline").setup{}
require("nvim-web-devicons").setup{}

