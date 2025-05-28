-- lua/settings/gui.lua
-- GUIを起動した時のディレクトリを$HOME(~)に

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.has("gui_running") == 1 then
      vim.cmd("cd ~")
    end
  end,
})
