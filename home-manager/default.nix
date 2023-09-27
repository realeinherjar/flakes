#  Specific system configuration settings for MacBook
#
#  flake.nix
#   └─ home-manager
#      └─ default.nix *
#
{ config, pkgs, vars, ... }:

{
  home-manager.users.${vars.user} = {
    home = {
      stateVersion = "23.11";
    };

    imports = [ ];
  };
}
