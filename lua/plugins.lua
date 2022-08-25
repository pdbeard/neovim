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
  use { 'nvim-treesitter/nvim-treesitter' }


  ---------------------------
  -- Telescope
  ---------------------------
  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-telescope/telescope.nvim' }
  use { 'nvim-telescope/telescope-fzy-native.nvim' }



  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end

end)

