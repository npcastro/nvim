local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- General
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Automatically close brackets
  use "numToStr/Comment.nvim" -- Commenting plugin
  use "lukas-reineke/indent-blankline.nvim" -- identation lines

  -- Bufferline
  use "akinsho/bufferline.nvim" -- Header that shows open buffers
  use "moll/vim-bbye" -- Prevents closing of windows when buffers are closed

  -- Colorschemes
  use "lunarvim/colorschemes" -- A bunch of colorschemes to try out
  use 'folke/tokyonight.nvim'
  use {'dracula/vim', as = 'dracula'} -- Dark dracula theme
  use {'arcticicestudio/nord-vim', as = 'nord'} -- Blueish color pallete
  use {'morhetz/gruvbox'}

  -- Completion
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp" -- nvim lsp completions
  use "hrsh7th/cmp-nvim-lua" -- nvim lua completions

  -- Git
  use "lewis6991/gitsigns.nvim"
  use "tpope/vim-fugitive"

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- Ruby
  use "RRethy/nvim-treesitter-endwise" -- auto add end

  -- Snippets
  use "L3MON4D3/LuaSnip" --snippet engine

  -- Telescope
  use "nvim-telescope/telescope.nvim"

  -- Tree
  use "kyazdani42/nvim-tree.lua" -- file explorer
  use "kyazdani42/nvim-web-devicons" -- optional icons for nvim-tree

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "p00f/nvim-ts-rainbow"
  use "JoosepAlviste/nvim-ts-context-commentstring" -- Uses treesitter to set the type of commentstring based on the location of the cursor.

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
