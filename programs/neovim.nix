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
    lsp-status-nvim
    nvim-treesitter

    # ui
    nerdtree
    vim-nerdtree-syntax-highlight
    vim-nerdtree-tabs
    tabline-nvim
    vim-devicons
  ];
  extraConfig = ''
  syntax on
  colorscheme catppuccin

  " open nerdtree; focus file
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
     
  autocmd BufRead * NERDTree

  let NERDTreeMapOpenInTab='<ENTER>'
  nmap <TAB> :NERDTreeFocusToggle<CR>
  nmap <S-Tab> :NERDTreeToggle<CR>
  '';
}
