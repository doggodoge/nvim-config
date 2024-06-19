-- This file can be loaded by calling `lua require('plugins')` from your init.lua

-- Only required if you have packer configured as `opt`

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  use { "ellisonleao/gruvbox.nvim" }

  use {
    'williamboman/mason.nvim',
    run = ':MasonUpdate' -- :MasonUpdate updates registry contents
  }

  use {
    'fatih/vim-go',
  }
end)

