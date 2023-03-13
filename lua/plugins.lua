
------------------------------------
local ensure_packer = function ()
  local execute = vim.api.nvim_command
  local fn = vim.fn

  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    execute 'packadd packer.nvim'
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

------------------------------------


vim.cmd [[packadd packer.nvim]]
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua


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
  use { 'catppuccin/nvim', as = 'catppuccin' }
  use { 'sainnhe/edge' }
  use { 'sainnhe/everforest' }
  use { 'sainnhe/sonokai' }
  use { 'sainnhe/gruvbox-material' }
  use {	'navarasu/onedark.nvim' }
  use { 'EdenEast/nightfox.nvim' }
  use { "savq/melange" }
  use { 'folke/tokyonight.nvim' }
  use { 'rose-pine/neovim' } 
  use { 'Mofiqul/vscode.nvim' }
  
  ---------------------------
  -- LSP
  ---------------------------
  use { 'williamboman/mason.nvim', config = lua_path"mason" }
  use { 'williamboman/mason-lspconfig.nvim', config = lua_path"mason-lspconfig" }
  use { 'neovim/nvim-lspconfig' }
  use { 'onsails/lspkind-nvim' }
  use { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' }  
  use { 'j-hui/fidget.nvim',  config = lua_path"fidget" }
  
  ---------------------------
  -- Autocomplete
  ---------------------------
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-vsnip' }
  use { 'hrsh7th/cmp-nvim-lua' }
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
  use { 'numToStr/Comment.nvim', config = lua_path"comment"}
  use { 'zdharma-continuum/zinit-vim-syntax' }
  use { 'RRethy/vim-illuminate' }
  
  ---------------------------
  -- Icons
  ---------------------------
  use {'kyazdani42/nvim-web-devicons'}
  use {'ryanoasis/vim-devicons'}

  ---------------------------
  -- Status Line and Bufferline
  ---------------------------
  --[[ use { 'famiu/feline.nvim', config = lua_path"feline" } ]]
  use { 'nvim-lualine/lualine.nvim', config = lua_path"lualine"}
  use { 'noib3/nvim-cokeline', config = lua_path"nvim-cokeline" } -- ALTERNATIVES: barbar.nvim, tabby.nvim, bufferline?  
  --[[ use { 'kazhala/close-buffers.nvim' } ]]

  ---------------------------
  -- Explorer
  ---------------------------
  use { 'kyazdani42/nvim-tree.lua', config = lua_path"nvimtree" }

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
  -- Folk
  ---------------------------
  use { 'folke/trouble.nvim' }
  --[[ use { 'folke/todo-comments.nvim', config = lua_path"todo-comments" } ]]
  use { 'folke/which-key.nvim', config = lua_path"which-key" }

  ---------------------------
  -- Telescope
  ---------------------------
  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-telescope/telescope.nvim' }
  use { 'nvim-telescope/telescope-fzy-native.nvim' }

  ---------------------------
  -- Debugger
  --------------------------- 
  use { 'mfussenegger/nvim-dap', config = lua_path"nvim-dap" }
  use { 'rcarriga/nvim-dap-ui', config = lua_path"nvim-dap-ui" }
  use { 'theHamsta/nvim-dap-virtual-text', config = lua_path"nvim-dap-virtual-text" }

  ---------------------------
  -- Other
  ---------------------------
  use { 'mg979/vim-visual-multi' , event = "BufReadPre" }

  --[[ use { 'machakann/vim-sandwich', config = lua_path"sandwich" } ]]
  use { 'rcarriga/nvim-notify', config = lua_path"nvim-notify" }
  --[[ use { 'airblade/vim-rooter', config = lua_path"vim-rooter" } ]]
  --[[ use { 'goolord/alpha-nvim', config = lua_path"alpha-nvim" } ]]
  --[[ use { 'jeffkreeftmeijer/vim-numbertoggle' } ]]
  --[[ use { 'lambdalisue/suda.vim' } ]]
  --[[ use { 'numtostr/FTerm.nvim', config = lua_path"fterm" } ]]
  --[[ use { 'wfxr/minimap.vim', config = lua_path"minimap" } ]]
  --[[ use { 'luukvbaal/stabilize.nvim', config = lua_path"stabilize" } ]]
  --[[ use { 'beauwilliams/focus.nvim', config = lua_path"focus" } ]]
  --[[ use { 'kevinhwang91/nvim-bqf' } ]]
  use ({'mvllow/modes.nvim',config = function() require('modes').setup() end })


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end

end)


