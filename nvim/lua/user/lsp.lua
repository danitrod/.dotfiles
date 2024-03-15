vim.cmd [[set completeopt=menu,menuone,noselect]]

-- Setup code completion.
local cmp = require 'cmp'

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
			{ name = 'nvim_lsp' },
			{ name = 'luasnip' },
		},
		{
			{ name = 'buffer' },
		})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Setup LSPs
require 'lspconfig'.gopls.setup {
	capabilities = capabilities,
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = false,
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
}
require 'lspconfig'.rust_analyzer.setup {
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {
			checkOnSave = {
				command = "clippy",
			},
		},
	},
}
require 'lspconfig'.pylsp.setup {
	capabilities = capabilities
}
require 'lspconfig'.bashls.setup {
	capabilities = capabilities
}
require 'lspconfig'.dockerls.setup {
	capabilities = capabilities
}
require 'lspconfig'.jsonls.setup {
	capabilities = capabilities
}
require 'lspconfig'.tsserver.setup {
	capabilities = capabilities
}
require 'lspconfig'.eslint.setup {
	capabilities = capabilities
}
require 'lspconfig'.marksman.setup {
	capabilities = capabilities
}
require 'lspconfig'.cmake.setup {
	capabilities = capabilities
}
require 'lspconfig'.taplo.setup {
	capabilities = capabilities
}
require 'lspconfig'.bufls.setup {
	capabilities = capabilities
}
require 'lspconfig'.html.setup {
	capabilities = capabilities
}
require 'lspconfig'.emmet_ls.setup {
	capabilities = capabilities,
	filetypes = { "css", "eruby", "html", "htmldjango", "javascript", "javascriptreact", "less", "sass", "scss", "svelte",
		"pug", "typescriptreact", "vue" },
}

-- custom comments
require('kommentary.config').configure_language("typescriptreact", {
	multi_line_comment_strings = { "{/*", "*/}" },
	prefer_multi_line_comments = true,
	prefer_single_line_comments = false,
})

-- For some reason lua_ls is not configured, add it manually
local lspconfig = require 'lspconfig'
local configs = require 'lspconfig.configs'
if not configs.lua_ls then
	configs.lua_ls = {
		default_config = {
			cmd = { '/opt/homebrew/bin/lua-language-server' },
			filetypes = { 'lua' },
			root_dir = function(fname)
				return lspconfig.util.find_git_ancestor(fname)
			end,
			settings = {},
		},
	}
end
require 'lspconfig'.lua_ls.setup {
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim' },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
}

-- Format on save
vim.cmd [[autocmd BufWritePre *\(.md\|.tsx\|.jsx\|.js\|.ts\|.json\|.html\|.htmldjango\|.sql\)\@<! lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.md Neoformat]]
vim.cmd [[autocmd BufWritePre *\(.tsx\|.jsx\|.ts\|.js\) Neoformat]]
vim.cmd [[autocmd BufWritePre *.json Neoformat prettier]]
vim.cmd [[autocmd BufWritePre *.html Neoformat]]
vim.cmd [[autocmd BufWritePre *.sql Neoformat sleek]]

-- Custom format args
vim.g.neoformat_htmldjango_djlint = {
	exe = 'djlint',
	args = { '-', '--reformat', '--indent 2', '--max-blank-lines 1', '--max-line-length 100' },
	stdin = 1,
}
vim.g.neoformat_try_node_exe = 1

-- Setup advanced syntax highlighting
require 'nvim-treesitter.configs'.setup {
	ensure_installed = { "go", "rust", "python", "javascript", "bash", "typescript", "html", "css",
		"json", "lua", "cmake", "dockerfile", "toml", "yaml", "tsx", "vim", "vimdoc" },
	highlight = {
		enable = true,
	},
	rainbow = {
		-- enable = true
	}
}

-- Test runner
require('nvim-test').setup {}
