{ config, pkgs, ... }:

{
  hardware.opengl.driSupport32Bit = true;
  programs.steam.remotePlay.openFirewall = true;
  environment.systemPackages = with pkgs; [
    steam
    steamPackages.steam-runtime
  ];
}
