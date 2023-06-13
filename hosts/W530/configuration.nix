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
    extraModprobeConfig = "options thinkpad_acpi fan_control=1";
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-label/home";
    fsType = "ext4"; 
  };

  networking = {
    hostName = "authorized_device_lol";
    hostId = "07b4a35f";
    networkmanager.enable = true;                                                                                                                                                                                                           
  };

  environment.systemPackages = with pkgs; [
    gnuradio
    libad9361
    st
  ];

  networking.wireless.interfaces = ["wlp3s0"];

  networking.wireless.networks = {
    "pps-wireless" = {
      ssid = "pps-wireless";
      keyManagement = "WPA-EAP";
      eap = "PEAP";
      identity = "svc-wireless-staff";
      password = "Lnpcvim#PaaX1Vvxet7NzW@eKdp8#MSkk#XqRN#PtdcoX7HR1pLg9Zv@GiiauX1STQYm0iwVTfw66jUAaz#FIabwZS9$nafJx2!";
      phase1 = "peapver=0";
      phase2 = "auth=MSCHAPV2";
    };
  };

  system.copySystemConfiguration = true;

  system.stateVersion = "22.05"; 
}
