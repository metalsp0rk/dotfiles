local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      -- vim.g.rose_pine_variant = 'moon'
      -- vim.g.rose_pine_disable_background = true
      vim.cmd('colorscheme rose-pine')
    end
  })
  use({'luisiacc/gruvbox-baby'})
  use({'nvim-lua/plenary.nvim'})
  use({'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}})
  use({'jamespeapen/swayconfig.vim'})
  use({'nvim-treesitter/nvim-treesitter-textobjects'})
  use({'phaazon/hop.nvim'})
  use({'nvim-tree/nvim-web-devicons'})
  use({'NeogitOrg/neogit'})
  use({'IogaMaster/neocord'})
  use({'sidebar-nvim/sidebar.nvim'})
  use({'mbbill/undotree'})
  use({'folke/which-key.nvim'})
  use({
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = true },
        panel = { enabled = false }
      })
    end
  })
  use({
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function ()
      require("copilot_cmp").setup({
      })
    end
  })
  use({"lewis6991/gitsigns.nvim"})
  use({'terrortylor/nvim-comment'})
  use({'stevearc/aerial.nvim'})
  use({'jiangmiao/auto-pairs'})
  use({'kyazdani42/nvim-tree.lua'})
  use({'theprimeagen/harpoon'})
  use({'akinsho/bufferline.nvim', tag = 'v2.*'})
  use({'nvim-lualine/lualine.nvim'})
  use({'christoomey/vim-tmux-navigator'})
  use({'towolf/vim-helm'})
  use({'nathom/filetype.nvim'})

  use({'dhruvasagar/vim-table-mode'})
  use({'mzlogin/vim-markdown-toc'})

  -- LSP
  use({'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},
      {'nvim-lua/lsp-status.nvim'},
      {'nvim-lua/lsp_extensions.nvim'},
      {'ray-x/lsp_signature.nvim'},
      {'folke/lsp-colors.nvim'},
      {'folke/lsp-trouble.nvim'},
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }})

  if packer_bootstrap then
    require('packer').sync()
  end
end)
