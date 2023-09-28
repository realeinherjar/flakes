{
  description = "NixOS/MacOS Valhalla Configs";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixpkgs-23.05-darwin";
    nix-darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprpicker.url = "github:hyprwm/hyprpicker";
    hypr-contrib.url = "github:hyprwm/contrib";
    impermanence.url = "github:nix-community/impermanence";
  };

  outputs = inputs @ { self, nix-darwin, nixpkgs, nixpkgs-stable, home-manager, hyprland, ... }:
    let
      vars = {
        # Variables used in flake
        user = "einherjar";
        terminal = "alacritty";
        editor = "hx"; # helium
      };
    in
    {
      # Linux (NixOS) machines Configurations
      nixosConfigurations = (
        import ./hosts {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs nixpkgs-stable home-manager hyprland vars;
        }
      );
      # macOS machines Configurations
      darwinConfigurations = (
        import ./darwin {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs nixpkgs-stable home-manager nix-darwin vars;
        }
      );
    };
}
