{ config, nixpkgs, home, overlays, inputs, ... }:

let system = "x86_64-linux";
in home.lib.homeManagerConfiguration {
	modules = [
    	./home.nix
	];

	pkgs = import inputs.nixpkgs {
		system = "${system}";
		config.allowUnfree = true;
		inherit overlays;
	};		

	extraSpecialArgs = { inherit inputs system overlays; };
}
