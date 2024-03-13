-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  -- b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  -- b.formatting.prettier.with { filetypes = { "html", "markdown", "css", "typescript" } }, -- so prettier works only on these filetypes
  b.diagnostics.eslint,
  -- b.formatting.eslint,
  b.code_actions.eslint,

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,
}

null_ls.setup {
  -- debug = true,
  sources = sources,
  -- on_attach = function(client, bufnr)
  --   if client.supports_method "textDocument/formatting" then
  --     vim.api.nvim_clear_autocmds {
  --       group = augroup,
  --       buffer = bufnr,
  --     }
  --     vim.api.nvim_create_autocmd("BufWritePre", {
  --       group = augroup,
  --       buffer = bufnr,
  --       callback = function()
  --         vim.lsp.buf.format { bufnr = bufnr, async = true }
  --       end,
  --     })
  --   end
  -- end,
}
