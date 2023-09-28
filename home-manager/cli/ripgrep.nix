#  Common home-manager configuration settings
#
#  flake.nix
#   └─ home-manager
#      ├─ default.nix
#      └─ cli
#         ├─ default.nix
#         └─ ripgrep.nix *
#

{ config, pkgs, vars, ... }:

{
  programs.ripgrep.enable = true;
}
