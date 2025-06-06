require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	-- Theme
	use { 'Mofiqul/dracula.nvim', as = 'dracula' }
	use 'kyazdani42/nvim-web-devicons'

	-- LSP
	use 'neovim/nvim-lspconfig'
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	-- Lua helpers
	use "nvim-lua/plenary.nvim"

	-- DAP
	use {
		'mfussenegger/nvim-dap',
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			dapui.setup()

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end

			dap.listeners.after.event_terminated["dapui_config"] = function()
				dapui.close()
			end

			dap.listeners.after.event_exited["dapui_config"] = function()
				dapui.close()
			end

			dap.adapters.go_remote = function(cb, config)
				local host = config.host or "127.0.0.1"
				cb({
					type = "server",
					port = config.port,
					host = host,
					substitutePath = config.substitutePath,
					executable = {
						command = "dlv",
						args = { "connect", host .. ":" .. config.port },
					},
				})
			end

			dap.configurations["go"] = {
				{
					name = "Monolith Docker Debug",
					request = "attach",
					type = "go_remote",
					mode = "remote",
					substitutePath = {
						{
							from = "${workspaceFolder}",
							to = "/go/src/server/server",
						},
					},
					port = 45653,
				},
				{
					name = "Papyrus Docker Debug",
					request = "attach",
					type = "go_remote",
					mode = "remote",
					substitutePath = {
						{
							from = "${workspaceFolder}",
							to = "/go/src",
						},
					},
					port = 4111,
				},
				{
					name = "Rating Engine Local Debug",
					request = "attach",
					type = "go_remote",
					mode = "remote",
					substitutePath = {
						{
							from = "${workspaceFolder}",
							to = "/go/src",
						},
					},
					port = 4099,
				},
				{
					name = "Rating Engine emPAS instance debug",
					request = "attach",
					type = "go_remote",
					mode = "remote",
					substitutePath = {
						{
							from = "${workspaceFolder}",
							to = "/go/src",
						},
					},
					host = "52.72.7.127",
					port = 4099,
				},
				{
					name = "Web Gateway local debug",
					request = "attach",
					type = "go_remote",
					mode = "remote",
					substitutePath = {
						{
							from = "${workspaceFolder}",
							to = "/tmp/gobuild",
						},
					},
					port = 45652,
				},
			}
		end
	}
	use {
		'rcarriga/nvim-dap-ui',
		requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" }
	}

	-- Test runners
	use "klen/nvim-test"

	-- Git integration
	use {
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end
	}
	use 'sindrets/diffview.nvim'

	-- code styling
	use 'p00f/nvim-ts-rainbow'
	use 'lukas-reineke/indent-blankline.nvim'
	use {
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup {}
		end
	}
	use 'jiangmiao/auto-pairs'
	use 'b3nj5m1n/kommentary'
	use 'sbdchd/neoformat'
	use {
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup {}
		end
	}

	-- nvim completion
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'

	-- GitHub Copilot
	use 'github/copilot.vim'

	-- snippets
	use({ "L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*" })
	use 'saadparwaiz1/cmp_luasnip'

	-- statusline
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	-- bookmarks
	use 'chentoast/marks.nvim'

	-- file explorer
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons',
		}
	}

	-- sort lines and vars
	use 'sQVe/sort.nvim'

	-- telescope
	use {
		'nvim-telescope/telescope.nvim', branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	-- bufferlines (tabs)
	use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }

	-- Golang
	use 'fatih/vim-go'

	-- Rust
	use 'mrcjkb/rustaceanvim'

	-- Markdown
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && yarn install",
		setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
		ft = { "markdown" }
	})

	-- Folding
	use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }

	-- Notifications
	use 'rcarriga/nvim-notify'

	-- Custom cmd prompt
	use { 'folke/noice.nvim', requires = { 'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify' } }
end)


-- install new plugins
vim.cmd [[
PackerCompile
PackerClean
PackerInstall
]]
