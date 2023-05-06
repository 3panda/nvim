# nvim
neovim settings file
# Preparations
The following preparations must be completed in advance.

## Placing the configuration file
I would place this repository as follows
```
~/.config/nvim
```
## Installing Neovim
Install Neovim with reference [here](https://github.com/neovim/neovim/wiki/Installing-Neovim)

## Install packer.nvim
Install packer.nvim with reference [here](https://github.com/wbthomason/packer.nvim#quickstart)

# Install the package 
Start Neovim and install the package without worrying about errors.
All subsequent operations are performed in vim command line mode.

````
:PackerInstall
````

Synchronize packages.
```
:PackerSync
```

# About installed packages

## Package management
[packer.nvim](https://github.com/wbthomason/packer.nvim)

## Tree viewer
[fern.vim](https://github.com/lambdalisue/fern.vim)

## LSP
* [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
* [mason.nvim](https://github.com/williamboman/mason.nvim)
* [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)

## Code Completion
* [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
* [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
* [vim-vsnip](https://github.com/hrsh7th/vim-vsnip)

