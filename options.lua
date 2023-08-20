local opt = vim.opt
local g = vim.g

g.neovide_input_macos_alt_is_meta = true
g.neovide_cursor_vfx_mode = "torpedo"

opt.mouse = ""
opt.wrap = false
opt.clipboard = ""
opt.autoread = true
opt.history = 999
opt.relativenumber = true
opt.swapfile = false
opt.guifont = {"JetBrainsMonoNL Nerd Font", ":h11"}
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false

opt.shell = "powershell"
opt.shellcmdflag = "-command"
opt.shellquote = "\""
opt.shellxquote = ""

-- Indenting
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4

vim.cmd "set nofixendofline"