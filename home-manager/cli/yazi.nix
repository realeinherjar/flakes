#  Common home-manager configuration settings
#
#  flake.nix
#   └─ home-manager
#      ├─ default.nix
#      └─ cli
#         ├─ default.nix
#         └─ yazi.nix *
#

{ config, pkgs, vars, ... }:

{
  programs.yazi.enable = true;
}
