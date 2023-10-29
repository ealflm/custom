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
    ["<leader>/"] = "",
    ["<leader>h"] = "",
    ["<leader>v"] = "",
  },
  t = {
    ["<A-h>"] = "",
    ["<A-i>"] = "",
    ["<A-v>"] = ""
  },
  v = {
    ["<Up>"] = "",
    ["<Down>"] = "",
    ["<leader>/"] = "",
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

    ["<leader>tt"] = { 
      function()
        require('base46').toggle_theme()
      end,
      "Toggle Theme",
    },

    ["<A-0>"] = {
      function()
        require('telescope').extensions.nvwork.select()
      end,
      "Open nvwork",
    }

  },
}

M.devenv = {
  plugin = true,

  n = {
    ["<A-m>"] = {
      function()
        require("devenv").OpenCurrentBufferDevEnv()
      end,
      "Open single file in visual studio",
    },
    ["<A-S-m>"] = {
      function()
        require("devenv").StartDevEnv()
      end,
      "Open all files in visual studio",
    },
  },
}

M.comment = {
  plugin = true,

  -- toggle comment in both modes
  n = {
    ["<A-/>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
  },

  v = {
    ["<A-/>"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
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
    ["<A-Space>"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<A-a>"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["<A-f>"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<A-S-f>"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },
    ["<A-r>"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["<A-y>"] = { "<cmd> Telescope resume <CR>", "Telescope resume" },

    -- git
    ["<A-c>"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<A-\">"] = { "<cmd> Telescope git_status <CR>", "Git status" },
    ["<A-d>"] = { "<cmd> Telescope git_stash <CR>", "Git stash" },
    ["<A-b>"] = { "<cmd> Telescope git_branches <CR>", "Git branches" },

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

    ["<A-;>"] = {
      function()
        require("nvterm.terminal").toggle "lazygit"
      end,
      "Toggle lazygit",
    },

    ["<A-,>"] = {
      function()
        require("nvterm.terminal").toggle "diffblank"
      end,
      "Toggle diffblank",
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

    ["<A-;>"] = {
      function()
        require("nvterm.terminal").toggle "lazygit"
      end,
      "Toggle lazygit",
    },

    ["<A-,>"] = {
      function()
        require("nvterm.terminal").toggle "diffblank"
      end,
      "Toggle diffblank",
    },

    ["<A-'>"] = {
      function()
        require("nvterm.terminal").toggle "nvwork"
      end,
      "Open Nvwork",
    },
  },

  i = {
    ["<A-'>"] = {
      function()
        require("nvterm.terminal").toggle "nvwork"
      end,
      "Open Nvwork",
    },
  }
}

M.diffview = {
  plugin = true,

  n = {
    ["<A-e>"] = {
      function()
        require("nvterm.terminal").toggle "diffview"
      end,
      "Toggle diffview",
    },

    ["<leader>gh"] = {
      "<cmd>DiffviewFileHistory<CR>",
      "Open DiffviewFileHistory",
    },

    ["<leader>gc"] = {
      "<cmd>DiffviewFileHistory %<CR>",
      "Open DiffviewFileHistory Current",
    },

    ["<leader>gq"] = {
      "<cmd>DiffviewClose<CR>",
      "Close Diffview",
    },
  },

  t = {
    ["<A-e>"] = {
      function()
        require("nvterm.terminal").toggle "diffview"
      end,
      "Toggle diffview",
    },
  }
}

M.gitsigns = {
    plugin = true,

    n = {
        -- Navigation through hunks
        ["<A-n>"] = {
            function()
                vim.schedule(function()
                    require("gitsigns").next_hunk()
                end)
            end,
            "Jump to next hunk",
        },

        ["<A-p>"] = {
            function()
                vim.schedule(function()
                    require("gitsigns").prev_hunk()
                end)
            end,
            "Jump to prev hunk",
        },

        ["<A-s>"] = {
            function()
                vim.schedule(function()
                    require("gitsigns").stage_hunk()
                end)
            end,
            "Stage hunk",
        },

        ["<leader>hr"] = {
            function()
                vim.schedule(function()
                    require("gitsigns").reset_hunk()
                end)
            end,
            "Reset hunk",
        },

        ["<A-S-s>"] = {
            function()
                vim.schedule(function()
                    require("gitsigns").stage_buffer()
                end)
            end,
            "Stage buffer",
        },

        ["<leader>hu"] = {
            function()
                vim.schedule(function()
                    require("gitsigns").undo_stage_hunk()
                end)
            end,
            "Undo stage hunk",
        },

        ["<leader>hR"] = {
            function()
                vim.schedule(function()
                    require("gitsigns").reset_buffer()
                end)
            end,
            "Reset buffer",
        },

        ["<leader>hp"] = {
            function()
                vim.schedule(function()
                    require("gitsigns").preview_hunk()
                end)
            end,
            "Preview hunk",
        },

        ["<leader>hb"] = {
            function()
                vim.schedule(function()
                    require("gitsigns").blame_line{full=true}
                end)
            end,
            "Blame line (full)",
        },

        ["<leader>tb"] = {
            function()
                vim.schedule(function()
                    require("gitsigns").toggle_current_line_blame()
                end)
            end,
            "Toggle current line blame",
        },

        ["<leader>hd"] = {
            function()
                vim.schedule(function()
                    require("gitsigns").diffthis()
                end)
            end,
            "Diff this",
        },

        ["<leader>hD"] = {
            function()
                vim.schedule(function()
                    require("gitsigns").diffthis('~')
                end)
            end,
            "Diff this (~)",
        },

        ["<leader>td"] = {
            function()
                vim.schedule(function()
                    require("gitsigns").toggle_deleted()
                end)
            end,
            "Toggle deleted",
        },
    },

    v = {
        ["<A-s>"] = {
            function()
                vim.schedule(function()
                    require("gitsigns").stage_hunk {vim.fn.line('.'), vim.fn.line('v')}
                end)
            end,
            "Stage hunk",
        },

        ["<leader>hr"] = {
            function()
                vim.schedule(function()
                    require("gitsigns").reset_hunk  {vim.fn.line('.'), vim.fn.line('v')}
                end)
            end,
            "Reset hunk",
        },
    },

    o = {
        ["ih"] = {
            ":<C-U>Gitsigns select_hunk<CR>",
            "Select hunk",
        },
    },

    x = {
        ["ih"] = {
            ":<C-U>Gitsigns select_hunk<CR>",
            "Select hunk",
        },
    },
}

if vim.g.clearmode == 1 then
  M.tabufline = {}
end

return M
