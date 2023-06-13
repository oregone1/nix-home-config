{
	config,
	pkgs,
    lib,
	...
}: {
  nix = {
    package = pkgs.nixFlakes; # or versioned attributes like nixVersions.nix_2_8
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    settings = {
#      substitute = false;
#      substituters = [""];
    };
  };

  hardware = {
    rtl-sdr.enable = true;
    sensor.iio.enable = true;
  };

  virtualisation = {
    libvirtd = {
      enable = true;
    };
    spiceUSBRedirection.enable = true;
  };

  time.timeZone = "America/Los_Angeles";

  security = {
    rtkit.enable = true; # Pipewire
    doas = {
      enable = true;
      extraConfig = "permit natalie as root";
      extraRules = [{
        users = ["natalie"];
        keepEnv = true;
      }];
    };

    polkit = {
      enable = true;
      extraConfig = ''
        polkit.addRule(function(action, subject) {
          if (subject.local) return "yes";
        });
      '';
    };
    sudo.enable = true;
  };

  services = {
    openssh = {
      enable = true;
      forwardX11 = true;
    };

    avahi.enable = true;

    xserver = {
      enable = true;
      autorun = false;
      layout = "dvorak";
      windowManager.i3 = {
        enable = true;
      };
      displayManager.sx = {
        enable = true;
      };
      libinput.enable = true;
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      jack.enable = true;
      pulse.enable = true;
    };
  };

  fonts = {
    fonts = with pkgs; [
      nerdfonts
      source-code-pro
      font-awesome_5
      cm_unicode
      fira-code
    ];
    fontconfig.enable = true;
  };

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  users.users.natalie = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" "plugdev" "libvirtd" "iio" ]; 
  };

  environment = {
    variables = {
      EDITOR = "nvim";
      BROWSER = "firefox";
    };
    systemPackages = with pkgs; [
      yq
      vim 
      wget
      xterm
      rsync
      i3blocks
      xorg.xkill
      xorg.xkbcomp
      xorg.xkbprint
      home-manager
      starship
      screen
      curl 
      git 
      jq
    ];
  };

  system.stateVersion = "22.05";
}
