{ pkgs, ...}:
{
  extraPackages = tpkgs: { inherit (tpkgs) collection-basic scheme-full pgfplots;};
}
