
-- Neovide 特有の設定 --
--  特有のカーソル設定（アニメーションOFF）
if vim.g.neovide then
  vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_cursor_trail_size = 0.0
  vim.g.neovide_cursor_antialiasing = false
  vim.g.neovide_cursor_animate_command_line = false
  vim.g.neovide_cursor_vfx_mode = ""
end
