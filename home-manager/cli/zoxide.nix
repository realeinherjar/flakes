#  Common home-manager configuration settings
#
#  flake.nix
#   └─ home-manager
#      ├─ default.nix
#      └─ cli
#         ├─ default.nix
#         └─ zoxide.nix *
#

{ config, pkgs, vars, ... }:

{
  programs = {
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
