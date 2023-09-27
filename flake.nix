{
  inputs = {
    # Principle inputs (updated by `nix run .#update`)
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-darwin.url = "github:lnl7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    flake-parts.url = "github:hercules-ci/flake-parts";
    nixos-flake.url = "github:srid/nixos-flake";
  };

  outputs = inputs@{ self, ... }:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-darwin" "x86_64-darwin" ];
      imports = [
        inputs.nixos-flake.flakeModule
      ];

      flake =
        let
          myUserName = "einherjar";
        in
        {
          # Configurations for Linux (NixOS) machines
          nixosConfigurations = {
            laptop = self.nixos-flake.lib.mkLinuxSystem {
              nixpkgs.hostPlatform = "x86_64-linux";
              imports = [
                ./common.nix
                ./linux.nix
                {
                  users.users.${myUserName}.isNormalUser = true;
                }
                self.nixosModules.home-manager
                {
                  home-manager.users.${myUserName} = {
                    imports = [
                      ./home/direnv.nix
                    ];
                    home.stateVersion = "23.11";
                  };
                }
              ];
            };
          };

          # Configurations for macOS machines
          darwinConfigurations = {
            macbook = self.nixos-flake.lib.mkMacosSystem {
              nixpkgs.hostPlatform = "aarch64-darwin";
              imports = [
                ./common.nix
                ./darwin.nix
                self.nixosModules.home-manager
                {
                  home-manager.users.einherjar = {
                    imports = [
                      ./home/direnv.nix
                    ];
                    home.stateVersion = "23.11";
                  };
                }
              ];
            };
          };
        };
    };
}
