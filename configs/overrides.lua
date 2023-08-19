local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",
  },
}

M.nvimtree = {
  on_attach = require("custom.configs.nvim-tree").on_attach,
  filters = {
    dotfiles = true,
    exclude = {vim.fn.stdpath "config" .. "/lua/custom"},
    custom = {".DS_Store", ".localized", ".workspace.md"}
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    debounce_delay = 50,
    severity = {
      min = vim.diagnostic.severity.ERROR,
      max = vim.diagnostic.severity.ERROR
    },
    icons = {hint = "", info = "", warning = "", error = ""}
  },
  git = {enable = true},
  renderer = {
    highlight_git = false,
    highlight_opened_files = "name",
    icons = {
      show = {git = true},
      glyphs = {
        git = {
          unstaged = "◇",
          staged = "◆",
          unmerged = "",
          renamed = "﹡",
          untracked = "⟡",
          deleted = "⊝",
          ignored = ""
        }
      }
    }
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {enable = true, global = true}
  },
  view = {
    adaptive_size = true
  },
  update_focused_file = {enable = false},
  filesystem_watchers = {
    enable = true,
  },
}

M.nvterm = {
  terminals = {
    type_opts = {
      float = {
        relative = 'editor',
        row = 0.07,
        col = 0.1,
        width = 0.8,
        height = 0.8,
        border = "double"
      }
    }
  }
}

return M
