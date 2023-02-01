{ pkgs, ... }:
{
  vimAlias = true;
  plugins = with pkgs.vimPlugins; [
    # languages for lsp/syntax
    vim-nix
    vim-yaml
    vim-json
    rust-vim
    haskell-vim
    vim-javascript
    LanguageTool-nvim

    # colorscheme
    catppuccin-nvim

    # autocomplete/lsp
    YouCompleteMe
    nvim-lspconfig
    lsp-status-nvim
    nvim-treesitter
    nvim-cmp
    cmp-nvim-lua
    cmp_luasnip
    luasnip
    cmp-nvim-lsp

    # ui
    lualine-nvim
    nvim-tree-lua
    vim-nerdtree-syntax-highlight
    vim-nerdtree-tabs
    tabline-nvim
    vim-devicons
    telescope-nvim

    # misc
    vimtex
    vim-css-color
  ];
  extraConfig = ''
    lua << EOF
      ${builtins.readFile ./assets/neovim/config.lua}
      ${builtins.readFile ./assets/neovim/tree.lua}
      ${builtins.readFile ./assets/neovim/keymap.lua}
      ${builtins.readFile ./assets/neovim/lspconfig.lua}
      ${builtins.readFile ./assets/neovim/telescope.lua}
      ${builtins.readFile ./assets/neovim/lualine.lua}
    EOF
  '';
}
