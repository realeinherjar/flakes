#
#  These are the different profiles that can be used when building on MacOS
#
#  flake.nix
#   └─ ./darwin
#       ├─ default.nix *
#       └─ <host>.nix
#

{ lib, inputs, nix-darwin, home-manager, vars, ... }:

let
  system = "aarch64-darwin"; # System Architecture
in
{
  macbook = nix-darwin.lib.darwinSystem {
    inherit system;
    specialArgs = { inherit inputs vars; };
    modules = [
      ./macbook.nix
      home-manager.darwinModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
      }
    ];
  };
}
