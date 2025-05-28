-- Swift
lspconfig.sourcekit.setup({
  cmd = { "sourcekit-lsp" },
  filetypes = { "swift", "objective-c", "objective-cpp" },
  root_dir = function() return vim.fn.getcwd() end,
})