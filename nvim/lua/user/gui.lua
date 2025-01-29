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
		side = "left",
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

-- setup notifications plugin
vim.notify = require("notify")

-- setup custom cmd prompt
require("noice").setup({
	lsp = {
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
		},
	},
	-- you can enable a preset for easier configuration
	presets = {
		bottom_search = true,         -- use a classic bottom cmdline for search
		command_palette = true,       -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false,           -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = false,       -- add a border to hover docs and signature help
	},
})
