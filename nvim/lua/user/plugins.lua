require('packer').startup(function(use)
 use 'wbthomason/packer.nvim'

 -- Theme
 use {'Mofiqul/dracula.nvim', as = 'dracula'}

 -- LSP
 use 'neovim/nvim-lspconfig'

 -- nvim completion
 use 'hrsh7th/cmp-nvim-lsp'
 use 'hrsh7th/cmp-buffer'
 use 'hrsh7th/cmp-path'
 use 'hrsh7th/cmp-cmdline'
 use 'hrsh7th/nvim-cmp'

 -- snippets
 use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})
 use 'saadparwaiz1/cmp_luasnip'

 -- Golang
 use 'fatih/vim-go'
end)

vim.cmd[[
  PackerCompile
  PackerClean
  PackerInstall
]]

