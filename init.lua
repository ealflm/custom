require "custom.options"
require "custom.presets"

vim.g.vscode_snippets_path = "C:/Users/ealflm/AppData/Roaming/Code/User/snippets"

vim.keymap.set("i", "<C-l>", 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true
