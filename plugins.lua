local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
      {
        "Hoffs/omnisharp-extended-lsp.nvim"
      }
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeFindFile" },
    opts = overrides.nvimtree
  },

  {
    "folke/which-key.nvim",
    enabled = false
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = overrides.blankline
  },

  {
    "nvim-telescope/telescope-ui-select.nvim",
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope
  },

  {
    "NvChad/nvterm",
    name = "nvterm_disabled",
    enabled = false,
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,
  },

  {
    "sindrets/diffview.nvim",
    lazy = false,
    opts = overrides.diffview,
    config = function(_, opts)
      require("diffview").setup(opts)
    end,
  },

  {
  "ealflm/nvterm",
    opts = overrides.nvterm,
    init = function()
      require("core.utils").load_mappings "nvterm"
    end,
    config = function(_, opts)
      require "base46.term"
      require("nvterm").setup(opts)
    end,
  },

  {
    "ealflm/nvwork",
    config = function()
      require("nvwork").setup()
    end,
  },

  {
    "ealflm/devenv",
    init = function()
      require("core.utils").load_mappings "devenv"
    end,
  },
}

return plugins
