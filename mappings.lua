---@type MappingsTable
local M = {}

M.nvimtree = {
    plugin = true,
  
    n = {
      -- toggle
      ["<tab>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  
      -- focus
      ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },
    },
}

return M
