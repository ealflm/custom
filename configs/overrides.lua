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
    "c_sharp"
  },
  indent = {
    enable = true,
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
    enable = false,
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
    adaptive_size = true,
    float = {
      enable = false,
      quit_on_focus_loss = true,
      open_win_config = {
        relative = "editor",
        border = "rounded",
        width = 30,
        height = 30,
        row = 1,
        col = 1,
      },
    },
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
      },
      fullfloat = {
        relative = 'editor',
        row = 0,
        col = 0,
        width = 1,
        height = 1,
        border = "single"
      }
    }
  }
}

M.blankline = {
  indentLine_enabled = 1,
  filetype_exclude = {
    "help",
    "terminal",
    "lazy",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "mason",
    "nvdash",
    "nvcheatsheet",
    "",
  },
  buftype_exclude = { "terminal" },
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
  show_current_context = false,
  show_current_context_start = false,
}

M.telescope = {
  extensions = {
    -- repo = {
    --   list = {
    --     fd_opts = {"--no-ignore-vcs"},
    --     search_dirs = {"D:/"}
    --   }
    -- }
  },
  -- extensions_list = {"ui-select", "repo"}
  extensions_list = {"themes", "terms", "ui-select"}
}

return M
