
-- kotlin
lspconfig.kotlin_language_server.setup({
  cmd = { "kotlin-language-server" },
  filetypes = { "kotlin" },
  root_dir = lspconfig.util.root_pattern("settings.gradle.kts", "build.gradle.kts", ".git"),
  capabilities = capabilities,
  init_options = vim.empty_dict(),  -- ← [{}] を防ぐ最も確実な手段
  settings = {},                    -- ← Neovim側の空設定を明示
})

