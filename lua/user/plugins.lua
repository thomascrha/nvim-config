local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  use("wbthomason/packer.nvim") -- Have packer manage itself
  use("navarasu/onedark.nvim")

  -- cmp plugins
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use("saadparwaiz1/cmp_luasnip")
  use("hrsh7th/cmp-nvim-lsp")

  -- snippets
  use("L3MON4D3/LuaSnip")
  use("rafamadriz/friendly-snippets")

  -- LSP
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use("neovim/nvim-lspconfig")
  use("jose-elias-alvarez/null-ls.nvim")
  use("j-hui/fidget.nvim")

  -- indent line
  use("lukas-reineke/indent-blankline.nvim")

  -- Fuzzy Finder (files, lsp, etc)
  use({
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    requires = { "nvim-lua/plenary.nvim" },
  })

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available
  use({
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
    cond = vim.fn.executable("make") == 1,
  })

  -- nvim tree
  use({
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
    tag = "nightly", -- optional, updated every week. (see issue #1193)
  })

  use({
    "ThePrimeagen/refactoring.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  })

  use({ -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    run = function()
      pcall(require("nvim-treesitter.install").update({ with_sync = true }))
    end,
  })

  use({ -- Additional text objects via treesitter
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
  })

  -- auto pairs
  use("windwp/nvim-autopairs")
  use("windwp/nvim-ts-autotag")

  use("nvim-lualine/lualine.nvim")

  -- TODO fix this
  -- trouble
  -- use({
  -- "folke/trouble.nvim",
  -- requires = "kyazdani42/nvim-web-devicons",
  -- })

  use({
    "numToStr/Comment.nvim",
  })

  use({
    "ray-x/navigator.lua",
    requires = {
      { "ray-x/guihua.lua", run = "cd lua/fzy && make" },
      { "neovim/nvim-lspconfig" },
    },
  })

  use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })

  use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })

  use("jayp0521/mason-nvim-dap.nvim")

  use("theHamsta/nvim-dap-virtual-text")

  -- Git related plugins
  use("tpope/vim-fugitive")
  use("tpope/vim-rhubarb")
  use("lewis6991/gitsigns.nvim")

  -- TODO setup with telescope
  use("AckslD/nvim-neoclip.lua")

  use("karb94/neoscroll.nvim")

  use("folke/which-key.nvim")

  use("nvim-treesitter/playground")

  use({
    "windwp/nvim-spectre",
    require = {
      " vim-lua/plenary.nvim",
    },
  })

  use("tpope/vim-sleuth") -- Detect tabstop and shiftwidth automatically

  -- remove trainling whitespace only with good behaviour
  use("axelf4/vim-strip-trailing-whitespace")

  -- resizing buffer shortcuts and behaviour
  use({
    "kwkarlwang/bufresize.nvim",
    config = function()
      require("bufresize").setup()
    end,
  })
  -- programming dictionaries
  use({ "psliwka/vim-dirtytalk", run = ":DirtytalkUpdate" })

  -- nice single file edditing
  use({ "folke/zen-mode.nvim" })

  -- undo history
  use("mbbill/undotree")

  -- scroll bar indication
  use("petertriho/nvim-scrollbar")
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
