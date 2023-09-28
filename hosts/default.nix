#  These are the different profiles that can be used when building NixOS.
#
#  flake.nix 
#   └─ ./hosts  
#       ├─ default.nix *
#       └─ ./<host>.nix
#           └─ default.nix 
#

{ lib, inputs, nixpkgs, nixpkgs-stable, home-manager, hyprland, vars, ... }:

let
  system = "x86_64-linux"; # System Architecture

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true; # Allow Proprietary Software
  };

  pkgs-stable = import nixpkgs-stable {
    inherit system;
    config.allowUnfree = true;
  };

  lib = nixpkgs.lib;
in
{
  laptop = lib.nixosSystem {
    # Laptop Profile
    inherit system;
    specialArgs = {
      inherit inputs hyprland vars;
      host = {
        hostName = "laptop";
        mainMonitor = "eDP-1";
        secondMonitor = "";
      };
    };
    modules = [
      ../packages.nix
      ./packages.nix
      ./laptop
      ./laptop/hardware-configuration.nix
      ./laptop/wayland.nix

      inputs.impermanence.nixosModules.impermanence
      home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = { inherit vars; };
          users.${vars.user} = {
            imports = [
              ../home-manager
              ../home-manager/linux.nix
            ]
            ++ [ inputs.hyprland.homeManagerModules.default ];
          };
        };
      }
    ];
  };
}
