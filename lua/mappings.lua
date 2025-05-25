-- --------------------------------------------
-- --------------------------------------------
-- mappings
-- --------------------------------------------
-- --------------------------------------------
--<Leader>をスペースキーに割当　※直接スペースを入れないとエラーになる

vim.g.mapleader = " "


-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


-- --------------------------------------------
-- insert mode
-- --------------------------------------------
-- カーソル操作
--inoremap <C-a> <Home>
vim.api.nvim_set_keymap('i', '<C-a>', '<Home>', { noremap = true })
--inoremap <C-e> <End>
vim.api.nvim_set_keymap('i', '<C-e>', '<End>', { noremap = true })
--inoremap <C-d> <Del>
vim.api.nvim_set_keymap('i', '<C-d>', '<Del>', { noremap = true })
----hjkl"
--inoremap <C-h> <Left>
vim.api.nvim_set_keymap('i', '<C-h>', '<Left>', { noremap = true })
--inoremap <C-j> <Down>
vim.api.nvim_set_keymap('i', '<C-j>', '<Down>', { noremap = true })
--inoremap <C-k> <Up>
vim.api.nvim_set_keymap('i', '<C-k>', '<Up>', { noremap = true })
--inoremap <C-l> <Right>
vim.api.nvim_set_keymap('i', '<C-l>', '<Right>', { noremap =  true })

--インサートモードでクリップボードの内容をペースト
--inoremap <C-p> <ESC>"*pa
vim.api.nvim_set_keymap('i', '<C-p>', '<ESC>"*pa', { noremap = true })

--インサートモード終了時に IME 状態を保存しない
----inoremap <silent> <Esc> <Esc>
--vim.api.nvim_set_keymap('i', '<Esc>', '<ESC>', { noremap = true, silent = true })
----inoremap <silent> <C-[> <Esc>
--vim.api.nvim_set_keymap('i', '<C-[>', '<ESC>', { noremap = true, silent = true })
----「日本語入力固定モード」切り替えキー
--vim.api.nvim_set_keymap('i', '<C-j>', '<C-^>', { noremap = true, silent = true })

-- --------------------------------------------
-- normal mode
-- --------------------------------------------
-- 日本語入力モードでもノーマルモードで最低限動作可能にする対応
vim.api.nvim_set_keymap('n', 'あ', 'a', { noremap = true })
vim.api.nvim_set_keymap('n', 'い', 'i', { noremap = true })
vim.api.nvim_set_keymap('n', 'お', 'o', { noremap = true })
vim.api.nvim_set_keymap('n', '：', ':', { noremap = true })
vim.api.nvim_set_keymap('n', '・', '/', { noremap = true })
-- set ESC+ESC Clear Search hilight
vim.api.nvim_set_keymap('n', '<ESC><ESC>', '<C-u>set nohlsearch!<CR>', { noremap = true })

-- ノーマルモードでもエンターキーで開業:w
vim.api.nvim_set_keymap('n', '<CR>', 'o<ESC>', { noremap = true })

-- Tab移動
vim.keymap.set("n", "<Tab>", ":tabnext<CR>", { desc = "次のタブへ" })
vim.keymap.set("n", "<S-Tab>", ":tabprevious<CR>", { desc = "前のタブへ" })

-- --------------------------------------------
-- fern.vim
-- --------------------------------------------

-- TODO Luaで書きたかったがうまく行かなかった
-- space key+nでファイルツリーを表示/非表示
vim.cmd([[
    nnoremap <Leader>n :Fern . -reveal=% -drawer -toggle -width=40<CR>
]])

-- 不可視ファイルを表示
vim.cmd([[
    let g:fern#default_hidden=1
]])





