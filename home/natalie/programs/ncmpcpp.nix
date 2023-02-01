{ pkgs, ... }:
{
  package = pkgs.ncmpcpp.override { visualizerSupport = true; };
}
