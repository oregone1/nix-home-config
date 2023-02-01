{
    pkgs,
	lib,
	stdenv,
	fetchFromGitHub,
	fetchpatch,
	pkg-config,
	ncurses,
	fontconfig,
	freetype,
	libX11,
	libXft,
	harfbuzz,
	...
}:

stdenv.mkDerivation {
	pname = "st";
	version = "latest";

	src = fetchFromGitHub {
		repo = "st-flexipatch";
		owner = "oregone1";
		rev = "master";
		sha256 = "sha256-JHEKbjPxlhvEWaYZgG1EJvHg9dmJI4OyJs14z84D82E=";
	};

	strictDeps = true;

	makeFlags = [
		"PKG_CONFIG=${stdenv.cc.targetPrefix}pkg-config"
	];

	nativeBuildInputs = [
		pkg-config
		ncurses
		fontconfig
		freetype
	];
  
  	buildInputs = [
    	libX11
    	libXft
		harfbuzz
  	];

	preInstall = ''
    	export TERMINFO=$out/share/terminfo
	'';

	installFlags = [ "PREFIX=$(out)" ];
}
