#  Specific home-manager configuration settings for MacOS
#
#  flake.nix
#   └─ home-manager
#      ├─ default.nix
#      └─ darwin.nix *
#

{ config, pkgs, vars, ... }:

{
  home = {
    homeDirectory = "/Users/${vars.user}";
  };
}
