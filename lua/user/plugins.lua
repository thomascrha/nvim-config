local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install your plugins here
require('lazy').setup({
  "navarasu/onedark.nvim",

  -- cmp plugins
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "saadparwaiz1/cmp_luasnip",
  "hrsh7th/cmp-nvim-lsp",

  -- snippets
  "L3MON4D3/LuaSnip",
  "rafamadriz/friendly-snippets",

  -- LSP
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  "j-hui/fidget.nvim",
  "folke/neodev.nvim",

  -- indent line
  "lukas-reineke/indent-blankline.nvim",

  -- Fuzzy Finder (files, lsp, etc)
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    cond = vim.fn.executable("make") == 1,
  },

  -- nvim tree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
    tag = "nightly", -- optional, updated every week. (see issue #1193)
  },
  --
  { -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    build = function()
      pcall(require("nvim-treesitter.install").update({ with_sync = true }))
    end,
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" }
  },

  -- auto pairs
  "windwp/nvim-autopairs",
  "windwp/nvim-ts-autotag",
  "nvim-lualine/lualine.nvim",

  -- trouble
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
  },

  "numToStr/Comment.nvim",

  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons"
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" }
  },

  "jayp0521/mason-nvim-dap.nvim",

  "theHamsta/nvim-dap-virtual-text",

  -- Git related plugins
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  "lewis6991/gitsigns.nvim",

  -- TODO setup with telescope
  "AckslD/nvim-neoclip.lua",

  "folke/which-key.nvim",

  {
    "windwp/nvim-spectre",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

  -- remove trainling whitespace only with good behaviour
  "axelf4/vim-strip-trailing-whitespace",

  -- resizing buffer shortcuts and behaviour
  {
    "kwkarlwang/bufresize.nvim",
    config = function()
      require("bufresize").setup()
    end,
  },

  -- programming dictionaries
  {
    "psliwka/vim-dirtytalk",
    build = ":DirtytalkUpdate"
  },

  -- undo history
  "mbbill/undotree",

  -- scroll bar indication
  "petertriho/nvim-scrollbar",

  -- virtualenv support for pyright
  -- {
  --   'HallerPatrick/py_lsp.nvim',
  --   config = function()
  --     require("py_lsp").setup()
  --   end,
  --
  -- }
 })

