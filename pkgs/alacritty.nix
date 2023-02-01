{ stdenv
, lib
, fetchFromGitHub
, fetchpatch
, rustPlatform

, cmake
, installShellFiles
, makeWrapper
, ncurses
, pkg-config
, python3

, expat
, fontconfig
, freetype
, libGL
, libX11
, libXcursor
, libXi
, libXrandr
, libXxf86vm
, libxcb
, libxkbcommon
, wayland
, xdg-utils
}:
let
  rpathLibs = [
    expat
    fontconfig
    freetype
    libGL
    libX11
    libXcursor
    libXi
    libXrandr
    libXxf86vm
    libxcb
    libxkbcommon
    wayland
  ];
in
rustPlatform.buildRustPackage rec {
  pname = "alacritty_ligature";
  version = "0.9.0";

  src = fetchFromGitHub {
    owner = "angtsusiong";
    repo = pname;
    rev = "refs/tags/v${version}";
    hash = "sha256-kgZEbOGmO+uRKaWR+oQBiGkBzDSuCznUyWNUoMICHhk=";
  };

  cargoSha256 = "sha256-2afnntapWRKw4ygovF2v/QlD0CW2ARvYy1dxyX+qdKQ=";

  nativeBuildInputs = [
    cmake
    installShellFiles
    makeWrapper
    ncurses
    pkg-config
    python3
  ];

  buildInputs = rpathLibs;

  outputs = [ "out" "terminfo" ];

  postPatch = ''
    substituteInPlace alacritty/src/config/ui_config.rs \
      --replace xdg-open ${xdg-utils}/bin/xdg-open
  '';

  checkFlags = [ "--skip=term::test::mock_term" ]; # broken on aarch64

  postInstall = ''
      mkdir -p $out
      install -D extra/linux/Alacritty.desktop -t $out/share/applications/
      install -D extra/linux/io.alacritty.Alacritty.appdata.xml -t $out/share/appdata/
      install -D extra/logo/compat/alacritty-term.svg $out/share/icons/hicolor/scalable/apps/Alacritty.svg

      # patchelf generates an ELF that binutils' "strip" doesn't like:
      #    strip: not enough room for program headers, try linking with -N
      # As a workaround, strip manually before running patchelf.
      strip -S $out/bin/alacritty

      patchelf --set-rpath "${lib.makeLibraryPath rpathLibs}" $out/bin/alacritty

      installShellCompletion --zsh extra/completions/_alacritty
      installShellCompletion --bash extra/completions/alacritty.bash
      installShellCompletion --fish extra/completions/alacritty.fish

      install -dm 755 "$out/share/man/man1"
      #gzip -c extra/alacritty.man > "$out/share/man/man1/alacritty.1.gz"
      #gzip -c extra/alacritty-msg.man > "$out/share/man/man1/alacritty-msg.1.gz"

      install -Dm 644 alacritty.yml $out/share/doc/alacritty.yml

      install -dm 755 "$terminfo/share/terminfo/a/"
      tic -xe alacritty,alacritty-direct -o "$terminfo/share/terminfo" extra/alacritty.info
      mkdir -p $out/nix-support
      echo "$terminfo" >> $out/nix-support/propagated-user-env-packages
  '';

  checkPhase = "";

  phases = ["unpackPhase" "patchPhase" "configurePhase" "buildPhase" "installPhase"]; 

  dontPatchELF = true;
}
