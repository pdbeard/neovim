vim.cmd [[packadd packer.nvim]]
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua


------------------------------------
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  execute 'packadd packer.nvim'
end
------------------------------------



require('packer').init({display = {auto_clean = false}})
return require('packer').startup(function(use)
  
  -- Load lua path
  local lua_path = function(name)
    return string.format("require'plugins.%s'", name)
  end

  ---------------------------
  -- Packer can manage itself
  ---------------------------
  use {'wbthomason/packer.nvim'}


  ---------------------------
  -- Colorschemes
  ---------------------------
  use { 'sainnhe/gruvbox-material' }
  use { 'catppuccin/nvim', as = 'catppuccin' }
  use {	'navarasu/onedark.nvim' }
  use { 'EdenEast/nightfox.nvim' }
  --[[ use { 'jacoborus/tender.vim'' } ]]

  ---------------------------
  -- LSP
  ---------------------------
  use { 'neovim/nvim-lspconfig' }
  use { 'onsails/lspkind-nvim' }
  use { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' }  

  ---------------------------
  -- Autocomplete
  ---------------------------
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-vsnip' }
  use { 'hrsh7th/vim-vsnip' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-calc' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'ray-x/cmp-treesitter' }
  use { 'lukas-reineke/cmp-rg' }
  use { 'quangnguyen30192/cmp-nvim-tags' }
  use { 'rafamadriz/friendly-snippets' }
  use { 'windwp/nvim-autopairs', config = lua_path"nvim-autopairs" }
  use { 'windwp/nvim-ts-autotag', config = lua_path"nvim-ts-autotag" }
  use { 'andymass/vim-matchup' }

  ---------------------------
  -- Syntax
  ---------------------------
  use { 'chrisbra/csv.vim' }
  use { 'junegunn/vim-easy-align' }
  use { 'mhartington/formatter.nvim', config = lua_path"formatter" }
  use { 'zdharma-continuum/zinit-vim-syntax' }
  use { 'numToStr/Comment.nvim', config = lua_path"comment"}
  
  ---------------------------
  -- Icons
  ---------------------------
  use {'kyazdani42/nvim-web-devicons'}
  use {'ryanoasis/vim-devicons'}

  ---------------------------
  -- Status Line and Bufferline
  ---------------------------
  use { 'famiu/feline.nvim', config = lua_path"feline" }
  use { 'kazhala/close-buffers.nvim' }
  use { 'noib3/nvim-cokeline', config = lua_path"nvim-cokeline" }
  
  
  ---------------------------
  -- Treesitter
  ---------------------------
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = lua_path"treesitter" }
  use { 'p00f/nvim-ts-rainbow', config = lua_path"nvim-ts-rainbow" }
  use { 'lukas-reineke/indent-blankline.nvim', config = lua_path"indent-blankline" }
  use { 'JoosepAlviste/nvim-ts-context-commentstring' }
  use { 'lewis6991/nvim-treesitter-context' }
  --use { 'SmiteshP/nvim-gps', config = lua_path"nvim-gps" }


  ---------------------------
  -- Telescope
  ---------------------------
  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-telescope/telescope.nvim' }
  use { 'nvim-telescope/telescope-fzy-native.nvim' }

  ---------------------------
  -- Other
  ---------------------------
  use { 'mg979/vim-visual-multi' , event = "BufReadPre" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end

end)

