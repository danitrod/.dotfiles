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

	-- Test runners
	use "klen/nvim-test"

	-- Git integration
	use {
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end
	}

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
	use 'tpope/vim-commentary'
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

	-- file explorer
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icons
		}
	}

	-- telescope
	use {
		'nvim-telescope/telescope.nvim', branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	-- bufferlines (tabs)
	use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'kyazdani42/nvim-web-devicons' }

	-- Golang
	use 'fatih/vim-go'

	-- Rust
	use 'simrat39/rust-tools.nvim'

	-- Markdown
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && yarn install",
		setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
		ft = { "markdown" }
	})
end)

-- install new plugins
vim.cmd [[
PackerCompile
PackerClean
PackerInstall
]]
