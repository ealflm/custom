local overrides = require "custom.configs.overrides"

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
        "Hoffs/omnisharp-extended-lsp.nvim",
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeFindFile" },
    opts = overrides.nvimtree,
  },

  {
    "folke/which-key.nvim",
    enabled = false,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = overrides.blankline,
  },

  {
    "nvim-telescope/telescope-ui-select.nvim",
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
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
    "lewis6991/gitsigns.nvim",
  },

  {
    "sindrets/diffview.nvim",
    lazy = false,
    opts = overrides.diffview,
    init = function()
      require("core.utils").load_mappings "diffview"
    end,
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
    lazy = false,
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

  {
    "mfussenegger/nvim-dap",
    config = function()
      require "custom.configs.nvim-dap"
      require("core.utils").load_mappings "dap"
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      require "custom.configs.nvim-dap-ui"
    end,
  },

  {
    "theHamsta/nvim-dap-virtual-text",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      require "custom.configs.nvim-dap-virtual-text"
    end,
  },
}

local disabled_plugins = {
  "neovim/nvim-lspconfig",
  "nvim-tree/nvim-tree.lua",
  "nvim-telescope/telescope-ui-select.nvim",
  "nvim-telescope/telescope.nvim",
  "ealflm/nvterm",
  "ealflm/devenv",
  "ealflm/nvwork",
}

if vim.g.clearmode ~= nil then
  if vim.g.clearmode == 2 then
    table.insert(disabled_plugins, "lewis6991/gitsigns.nvim")
    vim.api.nvim_set_hl(0, "DiffDelete", {})
    vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#273732" })
    vim.api.nvim_set_hl(0, "DiffText", { bg = "#243e5d" })
    vim.api.nvim_set_hl(0, "DiffChange", { bg = "#373844" })
  end

  for _, plugin in ipairs(plugins) do
    local plugin_name = plugin[1]
    if vim.tbl_contains(disabled_plugins, plugin_name) then
      plugin.enabled = false
    end
  end
end

return plugins
