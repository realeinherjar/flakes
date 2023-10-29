{ system, self, nixpkgs, inputs, user, ... }:

let
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true; # Allow proprietary software
  };

  lib = nixpkgs.lib;
in
{
  laptop = lib.nixosSystem {
    # Laptop profile
    inherit system;
    specialArgs = { inherit inputs user; };
    modules = [
      ./laptop/wayland # hyprland
    ] ++ [ ./system.nix ] ++ [
      inputs.impermanence.nixosModules.impermanence
      inputs.nur.nixosModules.nur
      inputs.hyprland.nixosModules.default
      inputs.agenix.nixosModules.default
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = { inherit user; };
          users.${user} = {
            imports = [ (import ./laptop/wayland/home.nix) ]
              ++ [
              inputs.hyprland.homeManagerModules.default
              inputs.arkenfox.hmModules.default
            ];
          };
        };
        nixpkgs = {
          overlays = [
            inputs.rust-overlay.overlays.default
            inputs.nur.overlay
            inputs.agenix.overlays.default
          ];
        };
      }
    ];
  };
  laptop-minimal = lib.nixosSystem {
    # Laptop-minimal profile
    inherit system;
    specialArgs = { inherit inputs user; };
    modules = [ ./laptop-minimal ] ++ [ ./system.nix ]
      ++ [ inputs.impermanence.nixosModules.impermanence ];
  };
}
