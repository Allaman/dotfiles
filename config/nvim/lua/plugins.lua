local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path}) execute 'packadd packer.nvim'
end

return require('packer').startup(function()
  -- Packer can manage itself https://github.com/wbthomason/packer.nvim
  use 'wbthomason/packer.nvim'

  -- https://github.com/nvim-telescope/telescope.nvim
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  -- https://github.com/famiu/nvim-reload
  use 'famiu/nvim-reload'

  -- https://github.com/marko-cerovac/material.nvim
  use 'marko-cerovac/material.nvim'

  -- https://github.com/b3nj5m1n/kommentary
  use 'b3nj5m1n/kommentary'

  -- https://github.com/kyazdani42/nvim-tree.lua
  use 'kyazdani42/nvim-tree.lua'

  -- https://github.com/numToStr/Navigator.nvim
  use 'numToStr/Navigator.nvim'

  -- https://github.com/kyazdani42/nvim-web-devicons
  use 'kyazdani42/nvim-web-devicons'

  -- https://github.com/lewis6991/gitsigns.nvim
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- https://github.com/glepnir/galaxyline.nvim
  use {
    'glepnir/galaxyline.nvim',
      branch = 'main'
  }

  -- https://github.com/norcalli/nvim-colorizer.lua
  use 'norcalli/nvim-colorizer.lua'

  -- https://github.com/windwp/nvim-autopairs
  use 'windwp/nvim-autopairs'

  -- https://github.com/nvim-treesitter/nvim-treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- https://github.com/tjdevries/astronauta.nvim
  use 'tjdevries/astronauta.nvim'

  -- https://github.com/hrsh7th/nvim-compe
  use 'hrsh7th/nvim-compe'

  -- https://github.com/hrsh7th/vim-vsnip
  use 'hrsh7th/vim-vsnip'
  -- https://github.com/rafamadriz/friendly-snippets
  use 'rafamadriz/friendly-snippets'


end)

