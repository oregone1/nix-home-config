{ config, pkgs, overlays, ... }:

{
  imports =
    [
      ../common
      ../modules/steam.nix
      ./hardware-configuration.nix
    ];

  hardware.bluetooth.enable = true;

  boot = {
    loader.grub = {
      enable = true;
      version = 2;
      device = "/dev/sda";
    };
    kernelModules = [ "v4l2loopback" ];
    kernelPackages = pkgs.linuxPackages_zen;
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-label/home";
    fsType = "ext4"; 
  };

  networking = {
    hostName = "W530";
    hostId = "07b4a35f";
    networkmanager.enable = true;                                                                                                                                                                                                           
  };

  environment.systemPackages = with pkgs; [
    gnuradio
    libad9361
    st
  ];

  system.copySystemConfiguration = true;

  system.stateVersion = "22.05"; 
}
