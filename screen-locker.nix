{ pkgs, ... }:
{
  inactiveInterval = 3;
  lockCmd = "rm screen*.png; \${pkgs.i3lock-pixeled}/bin/i3lock-pixeled";
}
