-- --------------------------------------------
-- --------------------------------------------
-- plugins
-- --------------------------------------------
-- --------------------------------------------

-- --------------------------------------------
-- import
-- --------------------------------------------

vim.cmd[[packadd packer.nvim]]

require("packer").startup(function(use)
-- opt オプションを付けると遅延読み込み 
-- opt = true　は使用されるタイミングで読み込まれる
    use{'wbthomason/packer.nvim'}
    use{"lambdalisue/fern.vim"}
    use{'neovim/nvim-lspconfig'}
    use{'williamboman/mason.nvim'}
    use{'williamboman/mason-lspconfig.nvim'}
    use{'hrsh7th/nvim-cmp'}
    use{'hrsh7th/cmp-nvim-lsp'}
    use{'hrsh7th/vim-vsnip'}
end)

-- プラグインを追加したり更新した時は以下のコマンドをコマンドラインモードで実行する
-- PackerInstall
-- PackerSync


