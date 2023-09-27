{
  description = "NixOS/MacOS Valhalla Configs";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-23.05-darwin";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    hyprland = {
      # Official Hyprland Flake
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = inputs @ { self, nix-darwin, nixpkgs, nixpkgs-unstable, home-manager, hyprland, ... }:
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
      #nixosConfigurations = (
      #  import ./hosts {
      #    inherit (nixpkgs) lib;
      #    # Inherit inputs
      #    inherit inputs nixpkgs nixpkgs-unstable home-manager hyprland vars;
      #  }
      #);
      # macOS machines Configurations
      darwinConfigurations = (
        import ./darwin {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs nixpkgs-unstable home-manager nix-darwin vars;
        }
      );
      # Nix Configurations
      #homeConfigurations = (
      #  import ./nix {
      #    inherit (nixpkgs) lib;
      #    inherit inputs nixpkgs nixpkgs-unstable home-manager vars;
      #  }
      #);
    };
}
