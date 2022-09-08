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
  ];
  extraConfig = ''
    lua << EOF
      ${builtins.readFile ./assets/config.lua}
      ${builtins.readFile ./assets/tree.lua}
      ${builtins.readFile ./assets/keymap.lua}
      ${builtins.readFile ./assets/lspconfig.lua}
      ${builtins.readFile ./assets/telescope.lua}
      ${builtins.readFile ./assets/lualine.lua}
    EOF
  '';
}
