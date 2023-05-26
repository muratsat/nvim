local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  b.formatting.gofumpt,
  b.formatting.goimports_reviser,
  b.formatting.golines,

  -- webdev stuff
  b.formatting.deno_fmt,                                                    -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,
}

local autogroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
  local buf_ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
  local needs_to_format = buf_ft == "go"
  if client.supports_method "textDocument/formatting" and needs_to_format then
    vim.api.nvim_clear_autocmds {
      group = autogroup,
      buffer = bufnr,
    }
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = autogroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format { bufnr = bufnr }
      end,
    })
  end
end

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = on_attach,
}
