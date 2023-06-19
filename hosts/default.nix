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
      ./laptop/wayland #hyprland
    ] ++ [
      ./system.nix
    ] ++ [
      inputs.impermanence.nixosModules.impermanence
      inputs.nur.nixosModules.nur
      inputs.hyprland.nixosModules.default
      inputs.sops-nix.nixosModules.sops
      inputs.home-manager.nixosModules.home-manager
      inputs.hosts.nixosModule.options.networking.stevenBlackHosts
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = { inherit user; };
          users.${user} = {
            imports = [
              (import ./laptop/wayland/home.nix)
            ] ++ [
              inputs.hyprland.homeManagerModules.default
            ];
          };
        };
        nixpkgs = {
          overlays =
            (import ../overlays)
              ++ [
              self.overlays.default
              inputs.rust-overlay.overlays.default
            ];
        };
        stevenBlackHosts = {
          enable = true;
          blockFakenews = true;
          blockGambling = false;
          blockPorn = false;
          blockSocial = false;
        };
      }
    ];
  };
  laptop-minimal = lib.nixosSystem {
    # Laptop-minimal profile
    inherit system;
    specialArgs = { inherit inputs user; };
    modules = [
      ./laptop-minimal
    ] ++ [
      ./system.nix
    ] ++ [
      inputs.impermanence.nixosModules.impermanence
      inputs.hosts.nixosModule.options.networking.stevenBlackHosts
      {
        stevenBlackHosts = {
          enable = true;
          blockFakenews = true;
          blockGambling = false;
          blockPorn = false;
          blockSocial = false;
        };
      }
    ];
  };

}
