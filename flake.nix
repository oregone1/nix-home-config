{
  description = "My nix config in flake form";

  inputs = {
    master.url = "github:nixos/nixpkgs/master"; 
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nur.url = "github:nix-community/nur"; 
    home = { 
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zsh-completions = {
      url = "github:zsh-users/zsh-completions";
      flake = false;
    };

    zsh-syntax-highlighting = {
      url = "github:zsh-users/zsh-syntax-highlighting";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, home, ... }@inputs:
    with nixpkgs.lib; let
      system = "x86_64-linux";
      config = {
        allowUnfree = true;
        allowBroken = true;
      };
      overlays = with inputs; [
        nur.overlay
        (import ./pkgs)
      ];
      packages = import nixpkgs {
        inherit system;
        inherit config;
      };
    in {
      homeConfigurations = {
        natalie = import ./home/natalie {inherit config nixpkgs home overlays inputs;};  
      };

      nixosConfigurations = {
        W530 = import ./hosts/W530 {inherit config nixpkgs overlays inputs;};  
      };
    };
}

