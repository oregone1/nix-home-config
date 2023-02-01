final: prev: {
  alacritty = prev.callPackage ./alacritty.nix {};
  st = prev.callPackage ./st.nix {};
  awesome-git = prev.callPackage ./awesome.nix {};
  awesome-config = prev.callPackage ./awesome-config.nix {};
}
