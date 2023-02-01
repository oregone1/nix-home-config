{ pkgs, ... }:
{
  enableAutosuggestions = true;
  enableCompletion = true;
  enableSyntaxHighlighting = true;
  defaultKeymap = "viins";
  dotDir = ".config/zsh";
  history = {
    size = 4294967296;
    save = 4294967296;
    path = "$HOME/.config/zsh/hist";
    extended = true;
    share = false;
  };
  initExtra = ''
    # set cursor
    echo -ne '\e[5 q'

    # handle keyboard
    if [ -n "$NVIM" ]; then 
      bindkey "^?" backward-delete-char
      bindkey "^[[3~" delete-char

      bindkey "^[[H" beginning-of-line
      bindkey "^[[F" end-of-line
    else
      bindkey "^?" backward-delete-char
      bindkey "^[[P" delete-char

      bindkey "^[[H" beginning-of-line
      bindkey "^[[4~" end-of-line

      bindkey "^Y" up-line
      bindkey "^E" down-line
    fi

    bindkey "^[[5~" up-line-or-history
    bindkey "^[[6~" down-line-or-history

    bindkey "^[[A" up-line-or-search
    bindkey "^[[B" down-line-or-search

    bindkey "^[[D" backward-char
    bindkey "^[[C" forward-char

    bindkey -r "^@"

    alias ls=exa 

    # set cursor to block on entering zle
    function zle-keymap-select () {
        case $KEYMAP in
            vicmd) echo -ne '\e[1 q';;      # block
            viins|main) echo -ne '\e[5 q';; # beam
        esac
    }
    zle -N zle-keymap-select

    zstyle ":completion:*" menu select
    function command_not_found_handler() {printf "Not Found: '\033[31;1;5m%s\033[0m'" "$0" | cut -d'%' -f1}
  '';
}
