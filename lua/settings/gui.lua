-- lua/settings/gui.lua
-- GUIを起動した時のディレクトリを$HOME(~)に

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.has("gui_running") == 1 then
      vim.cmd("cd ~")
    end
  end,
})


-- GUI環境（macOS）でコマンドラインモード中の⌘V（Command + V）ペースト遅延を解消

if vim.fn.has("mac") == 1 and vim.fn.has("gui_running") == 1 then
  vim.keymap.set('c', '<D-v>', function()
    vim.schedule(function()
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-r>+', true, false, true), 'n', true)
    end)
  end, { noremap = true, silent = true })
end
