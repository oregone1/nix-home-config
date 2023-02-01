{ pkgs }:

let
  config = pkgs.runCommand "awesome-config" {
    buildInputs = [];
    src = /home/natalie/github/nix/home/natalie/programs/assets/awesome;
  };

in pkgs.stdenv.mkDerivation {
  name = "awesome-config";
  buildCommand = ''
    mkdir -p $out/config
    cp -r $src $out/config
  '';
  installPhase = ''
    mkdir -p $home/.config/awesome
    ln -sfn $out/config $home/.config/awesome
  '';
}
