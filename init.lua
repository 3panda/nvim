-- --------------------------------------------
-- --------------------------------------------
-- import
-- --------------------------------------------
-- --------------------------------------------

require'plugins'
require'mappings'

-- --------------------------------------------
-- --------------------------------------------
-- Basic
-- --------------------------------------------
-- --------------------------------------------

local opt = vim.opt

-- マウスの有効化
opt.mouse = 'a'
-- エンコードの指定
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'
-- 改行コード
opt.fileformats = 'unix','dos'
-- 行番号を付ける
opt.number = true
-- ビープ音と画面フラッシュの停止（設定が効かない場合があるので注意）
opt.belloff = all
-- ファイルに応じて見やすく色付けをしてくれる
opt.syntax = on
-- 大文字小文字無視
opt.ignorecase = true
--  IMを無効化
opt.imdisable = true
--  Yankした情報を他のアプリケーションでも利用
opt.clipboard = "unnamedplus"
--  ファイルエンコーディングや文字コードをステータス行に表示
opt.laststatus = 2
-- TOdo statuslineはlualine.nvimを検討

-- 起動時に確実にIMEをoffにする
opt.iminsert = 0
-- 絶対に自動改行しない
opt.formatoptions = q
-- 単語を途中で折らない
opt.linebreak = true
-- 日本語の行の連結時には空白を入力しない。
opt.formatoptions:append('mM')
-- □や○の文字があってもカーソル位置がずれないようにする。
opt.ambiwidth = 'double'
-- 画面最後の行をできる限り表示する。
opt.display ='lastline'
-- Change the current working directory automatically
opt.autochdir = true;

-- --------------------------------------------
-- Tab
-- --------------------------------------------
--タブを半角スペースに展開
opt.expandtab = true
--タブの半角スペース数
opt.tabstop = 4
--タブの入力時に挿入する半角スペース数
-- opt.softtabstop = 1
-- タブを常に表示
-- opt.showtabline = 2
-- インデントの見た目の空白数の設定値
opt.shiftwidth = 0
-- 不可視文字を表示
opt.list = true
opt.listchars:append("eol:↲")
opt.listchars:append("space:⋅")


-- --------------------------------------------
-- Search
-- --------------------------------------------
-- 検索したときにハイライトを付ける
opt.hlsearch = true
-- 最後まで検索したら先頭へ戻る
opt.wrapscan = true
-- 検索文字列に大文字が含まれている場合は区別して検索
opt.smartcase = true
-- --------------------------------------------
-- GUI
-- --------------------------------------------
-- background
opt.background = 'dark'
-- Font
opt.guifont = { 'Andale', 'Mono:h14'}
-- colorscheme
----  colorschemeは好きなものをDLしてcolorsフォルダ以下に配置する
-- vim.cmd 'colorscheme hybrid'
-- vim.cmd 'colorscheme monokai'



-- --------------------------------------------
-- --------------------------------------------
-- LSP
-- --------------------------------------------
-- --------------------------------------------

-- 1. LSP Sever management
require('mason').setup()
require('mason-lspconfig').setup_handlers({ function(server)
  local opt = {
    -- -- Function executed when the LSP server startup
    -- on_attach = function(client, bufnr)
    --   local opts = { noremap=true, silent=true }
    --   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    --   vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)'
    -- end,
    capabilities = require('cmp_nvim_lsp').update_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    )
  }
  require('lspconfig')[server].setup(opt)
end })


-- 2. build-in LSP function
-- keyboard shortcut
vim.keymap.set('n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
-- LSP handlers
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
)
-- Reference highlight
vim.cmd [[
set updatetime=500
highlight LspReferenceText  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceRead  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceWrite cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
augroup lsp_document_highlight
  autocmd!
  autocmd CursorHold,CursorHoldI * lua vim.lsp.buf.document_highlight()
  autocmd CursorMoved,CursorMovedI * lua vim.lsp.buf.clear_references()
augroup END
]]

-- 3. completion (hrsh7th/nvim-cmp)
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    -- { name = "buffer" },
    -- { name = "path" },
  },
  mapping = cmp.mapping.preset.insert({
    --["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    --["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ['<C-l>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm { select = true },
  }),
  experimental = {
    ghost_text = true,
  },
})



-- --------------------------------------------
-- --------------------------------------------
-- flutter-tools
-- --------------------------------------------
-- --------------------------------------------









