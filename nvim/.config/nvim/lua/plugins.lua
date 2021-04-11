-- vim.cmd [[packadd packer.nvim]]
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
	execute 'packadd packer.nvim'
end

local my = function(file) require(file) end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

-- require('packer').init({display = {non_interactive = true}})
require('packer').init({display = {auto_clean = false}})

return require('packer').startup(function(use)

	-- Packer can manage itself as an optional plugin
	use 'wbthomason/packer.nvim'
	-- LSP
	use { 'neovim/nvim-lspconfig' }
	use { 'nvim-lua/completion-nvim' }
	use {'kabouzeid/nvim-lspinstall'}
	use "onsails/lspkind-nvim"
	-- Explorer
	use 'kyazdani42/nvim-tree.lua'
	-- Statusline and Bufferline
	use { 'glepnir/galaxyline.nvim' }
	use {'akinsho/nvim-bufferline.lua'}
	-- Treesitter
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
	use 'p00f/nvim-ts-rainbow'
	use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}
	use 'JoosepAlviste/nvim-ts-context-commentstring' 
	use 'windwp/nvim-ts-autotag'
	-- Git
	use {'lewis6991/gitsigns.nvim'}
	use { "f-person/git-blame.nvim" }
	-- Telescope
	use 'nvim-lua/popup.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'
	-- Colorscheme
	use "norcalli/nvim-base16.lua"
	-- Icons
	use 'kyazdani42/nvim-web-devicons'
	use 'ryanoasis/vim-devicons'
	-- Others
	use 'windwp/nvim-autopairs'

end)
