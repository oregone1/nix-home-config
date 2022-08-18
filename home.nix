{ config, pkgs, lib, ... }:
{
  home.username = "natalie";
  home.homeDirectory = "/home/natalie";
  
  programs.home-manager.enable = true;

  programs = {
    neovim = {
      enable = true;
    } // (import ./programs/neovim.nix { inherit pkgs; });

    i3status-rust = {
      enable = true;
    } // (import ./programs/i3status-rust.nix { inherit pkgs; });

    kitty = {
      enable = true;
    } // (import ./programs/kitty.nix { inherit pkgs; });

    rofi = {
      enable = true;
    } // (import ./programs/rofi.nix { inherit pkgs; inherit (config.lib.formats.rasi) mkLiteral; });

    starship = {
      enable = true;
    } // (import ./programs/starship.nix { inherit pkgs; });
  };

  services = {
    screen-locker = {
      enable = true;
    } // (import ./services/screen-locker.nix { inherit pkgs; });
  };

  xsession = {
    windowManager = {
      i3 = {
        enable = true;
      } // (import ./programs/i3.nix { inherit pkgs; inherit lib; });
    };
  };

  home.packages = with pkgs; [
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
    yt-dlp
    feh
    firefox
    discord-canary
    gnome.gnome-screenshot
    xfce.xfce4-taskmanager
    obsidian
    lxappearance
    neovide
    ripgrep
    bat
    picom
  ];

  home.stateVersion = "22.05";
}
