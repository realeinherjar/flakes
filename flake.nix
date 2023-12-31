{
  description = "My Personal NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    impermanence.url = "github:nix-community/impermanence";
    nur.url = "github:nix-community/NUR";
    flake-parts.url = "github:hercules-ci/flake-parts";
    agenix.url = "github:ryantm/agenix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    arkenfox = {
      url = "github:dwarfmaster/arkenfox-nixos";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, flake-parts, nur, agenix, ... }:
    let
      user = "einherjar";
    in
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      perSystem = { config, inputs', pkgs, system, ... }:
        let
          pkgs = import nixpkgs {
            inherit system;
          };
        in
        {
          devShells = {
            #run by `nix develop` or `nix-shell`(legacy)
            default = import ./shell.nix { inherit pkgs; };
          };

          formatter = pkgs.nixpkgs-fmt;
        };

      flake = {
        nixosConfigurations = (import ./hosts {
          system = "x86_64-linux";
          inherit nixpkgs self inputs user;
        });
      };
    };
}
