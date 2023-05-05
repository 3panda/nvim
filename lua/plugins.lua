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
    --Flutterサポート　Flutterをneovimで開発したい場合に必要
    --use {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim'} 
    
end)

-- プラグインを追加したり更新した時は以下のコマンドをコマンドラインモードで実行する
-- PackerInstall
-- PackerSync


