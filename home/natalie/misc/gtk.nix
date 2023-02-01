{ pkgs, ... }:
let 
  catppuccinIcons = let
    catppuccinIcons = builtins.fetchTarball {
      url = "https://github.com/ljmill/catppuccin-icons/releases/download/v0.2.0/Catppuccin-SE.tar.bz2";
      sha256 = "1gbsp2bi23wl2wiyj730c21vz4ngmv5wz1q4jljnlk0nk2fvvq59";
    };
  in 
    pkgs.runCommand "CatpuccinIcons" { } ''
      cp -r $out/${catppuccinIcons} /usr/share/
      echo eeeee
      mv ${catppuccinIcons} /usr/share/
    '';
in {
  iconTheme.name = "catpuccinIcons";
}




