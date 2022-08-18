{ pkgs, ... }:
{
  inactiveInterval = 3;
  lockCmd = "\${pkgs.i3lock-pixeled}/bin/i3lock-pixeled";
}
