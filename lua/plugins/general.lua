return {
  { "nvim-lua/popup.nvim"  },                 -- Useful lua functions used by lots of plugins
  { "nvim-lua/plenary.nvim" },                -- An implementation of the Popup API from vim in Neovim
  { "windwp/nvim-autopairs" },                -- Automatically close brackets
  { "numToStr/Comment.nvim" },                 -- Commenting plugin
  { "lukas-reineke/indent-blankline.nvim" },   -- identation lines
  { "kylechui/nvim-surround" },                -- sorround symbols

  -- Lualine
  { "nvim-lualine/lualine.nvim", dependencies = { "kyazdani42/nvim-web-devicons", lazy = true } },

  -- Ruby
  { "RRethy/nvim-treesitter-endwise" }, -- auto add end

  -- Snippets
  { "L3MON4D3/LuaSnip" }, -- snippet engine

  -- Supermaven
  { "supermaven-inc/supermaven-nvim" },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", lazy = true }
    }
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },

  -- Tree
  { "kyazdani42/nvim-tree.lua" }, -- file explorer
  { "kyazdani42/nvim-web-devicons" }, -- optional icons for nvim-tree

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  { "JoosepAlviste/nvim-ts-context-commentstring" }, -- Uses treesitter to set the type of commentstring based on the location of the cursor.
}
