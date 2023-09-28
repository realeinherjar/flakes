#  Common home-manager configuration settings
#
#  flake.nix
#   └─ home-manager
#      ├─ default.nix
#      └─ cli
#         ├─ default.nix
#         └─ eza.nix *
#

{ config, pkgs, vars, ... }:

{
  programs.eza.enable = true;
}
