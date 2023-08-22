---@type MappingsTable
local M = {}

M.disabled = {
  i = {
    ["<C-b>"] = "",
    ["<C-e>"] = "",
    ["<C-h>"] = "",
    ["<C-l>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
  },
  n = {
    ["<TAB>"] = "",
    ["<S-Tab>"] = "",
    ["<C-n>"] = "",
    ["<C-s>"] = "",
    ["[c"] = "",
    ["]c"] = "",
    ["[d"] = "",
    ["d]"] = "",
    ["<A-h>"] = "",
    ["<A-i>"] = "",
    ["<A-v>"] = "",
    ["<Leader>fw"] = "",
    ["<Esc>"] = "",
    ["<C-s>"] = "",
    ["<C-c>"] = "",
    ["<leader>n"] = "",
    ["<leader>rn"] = "",
    ["j"] = "",
    ["k"] = "",
    ["<Up>"] = "",
    ["<Down>"] = "",
    ["<leader>b"] = "",
    ["<leader>fm"] = "",
    ["<leader>ff"] = "",
    ["<leader>fa"] = "",
    ["<leader>fw"] = "",
    ["<leader>fz"] = "",
    ["<leader>cm"] = "",
    ["<leader>gt"] = "",
  },
  t = {
    ["<A-h>"] = "",
    ["<A-i>"] = "",
    ["<A-v>"] = ""
  },
  v = {
    ["<Up>"] = "",
    ["<Down>"] = "",
  },
  x = {
    ["j"] = "",
    ["k"] = "",
  },
}

M.general = {
  n = {
    -- navigate within insert mode
    ["<A-v>"] = { "<C-v>", "Block select mode" },
    ["<A-i>"] = { "<C-i>", "Goes to the older position" },
    ["<A-o>"] = { "<C-o>", "Goes to the newer one" },

    -- scripts
    ["<A-m>"] = { 
      function()
        require("custom.scripts.devenv").StartDevEnv()
      end,
      "Open Visual Studio",
    },
  },
}

M.nvimtree = {
    plugin = true,
  
    n = {
      -- toggle
      ["<tab>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  
      ["<A-.>"] = { "<cmd> NvimTreeFindFile <CR>", "Nvimtree find file" },
    },
}

M.tabufline = {
  plugin = true,

  n = {
    -- cycle through buffers
    ["<C-e>"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    ["<C-q>"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },

    -- close buffer + hide terminal buffer
    ["<C-w>"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close buffer",
    },
  },
}

M.lspconfig = {
  plugin = true,

  -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

  n = {
    ["<A-CR>"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },
    ["<leader>fk"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },
    ["<A-[>"] = {
      function()
        vim.diagnostic.goto_prev { float = { border = "rounded" } }
      end,
      "Goto prev",
    },
    ["<A-]>"] = {
      function()
        vim.diagnostic.goto_next { float = { border = "rounded" } }
      end,
      "Goto next",
    },
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<A-;>"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<A-a>"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["<A-/>"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<A-f>"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },
    ["<A-r>"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },

    -- git
    ["<A-c>"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<A-'>"] = { "<cmd> Telescope git_status <CR>", "Git status" },
    ["<A-s>"] = { "<cmd> Telescope git_stash <CR>", "Git stash" },
    ["<A-y>"] = { "<cmd> Telescope git_branches <CR>", "Git branches" },

    -- repo
    -- ["<A-'>"] = { "<cmd> Telescope repo list <CR>", "Open all repository in system" },
  },
}

M.nvterm = {
  plugin = true,

  t = {
    -- toggle in terminal mode
    ["<A-u>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },

    ["<A-->"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },

    ["<A-=>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },
  },

  n = {
    -- toggle in normal mode
    ["<A-u>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },

    ["<A-->"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },

    ["<A-=>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },
  },
}

M.gitsigns = {
  plugin = true,

  n = {
    -- Navigation through hunks
    ["<A-n>"] = {
      function()
        if vim.wo.diff then
          return "<A-n>"
        end
        vim.schedule(function()
          require("gitsigns").next_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to next hunk",
      opts = { expr = true },
    },

    ["<A-p>"] = {
      function()
        if vim.wo.diff then
          return "<A-p>"
        end
        vim.schedule(function()
          require("gitsigns").prev_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to prev hunk",
      opts = { expr = true },
    },
  },
}

return M
