#  Helix home-manager configuration settings
#
#  flake.nix
#   └─ home-manager
#      ├─ default.nix
#      └─ shell
#         └─ default.nix *
#

{ config, pkgs, vars, ... }:

{
  imports = [ ./fish/fish.nix ./git.nix ./tmux.nix ];
}
