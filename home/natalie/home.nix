{ config, inputs, lib, pkgs, system, ... }:
{
  home.username = "natalie";
  home.homeDirectory = "/home/natalie";
  
  programs.home-manager.enable = true;

  programs = {
    neovim = {
      enable = true;
    } // (import ./programs/neovim.nix { inherit pkgs; });

    helix = {
      enable = true;
    } // (import ./programs/helix.nix { inherit pkgs; });

    kakoune = {
      enable = true;
    } // (import ./programs/kakoune.nix { inherit pkgs; }); 
    
    i3status-rust = {
      enable = true;
    } // (import ./programs/i3status-rust.nix { inherit pkgs; });

    alacritty = {
      enable = true;
    } // (import ./programs/alacritty.nix { inherit pkgs; });

   kitty = {
      enable = true;
    } // (import ./programs/kitty.nix { inherit pkgs; });

    rofi = {
      enable = true;
    } // (import ./programs/rofi.nix { inherit pkgs; inherit (config.lib.formats.rasi) mkLiteral; });

    starship = {
      enable = true;
    } // (import ./programs/starship.nix { inherit pkgs; });
    
    texlive = {
      enable = true;
    } // (import ./programs/texlive.nix { inherit pkgs; });

    zathura = {
      enable = true;
    } // (import ./programs/zathura.nix { inherit pkgs; });

    chromium = {
      enable = true;
    } // (import ./programs/chromium.nix { inherit pkgs; });

    dircolors = {
      enable = true;
    } // (import ./programs/dircolors.nix { inherit pkgs; });

    zsh = {
      enable = true;
    } // (import ./programs/zsh.nix { inherit pkgs; });

    ncmpcpp = {
      enable = true;
    } // (import ./programs/ncmpcpp.nix { inherit pkgs; });

    emacs = {
      enable = true;
    } // (import ./programs/emacs.nix { inherit pkgs; });
  };

  services = {
  # screen-locker = {
  #   enable = true;
  # } // (import ./services/screen-locker.nix { inherit pkgs; });
  #  polybar = {
  #    enable = true;
  #  } // (import ./services/polybar.nix { inherit pkgs; });
    mpd = {
      enable = true;
    } // (import ./services/mpd.nix { inherit pkgs; });
    dunst = {
      enable = true;
    } // (import ./programs/dunst.nix { inherit pkgs; });
  };

  xsession = {
    windowManager = {
      i3 = {
        enable = true;
      } // (import ./programs/i3.nix { inherit pkgs; inherit lib; });

      awesome = {
        enable = true;
      } // (import ./programs/awesome.nix { inherit pkgs; });
    };
  };

  wayland = {
    windowManager = {
      sway = {
        enable = true;
      } // (import ./programs/sway.nix { inherit pkgs; inherit lib; inherit (config.lib.formats.rasi) mkLiteral; });
    };
  };

  #gtk = {
  #  enable = true;
  #} // (import ./misc/gtk.nix { inherit pkgs; });

  home.packages = with pkgs; [

    # awesome-config

    calc
    i3lock-pixeled
    filezilla
    espeak-ng
    imagemagick
    ffmpeg-full
    mpv
    neofetch
    pavucontrol
    python39
    simplescreenrecorder
    tree
    st
    #    firefox
    discord-canary
    gnome.gnome-screenshot
    xfce.xfce4-taskmanager
    # obsidian
    lxappearance
    neovide
    ripgrep
    bat
    picom
    cargo
    crate2nix
    rofi-wayland
    firefox-wayland
    swaybg
    exa

    # lsp servers (should maybe move to neovim conf)
    nodePackages.vscode-html-languageserver-bin
    nodePackages.vscode-css-languageserver-bin
    nodePackages.yaml-language-server 
    nodePackages.pyright
    texlab
    rust-analyzer  
    haskell-language-server
    rnix-lsp
  ];

  home.stateVersion = "22.05";
}
