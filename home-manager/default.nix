#  Common home-manager configuration settings
#
#  flake.nix
#   └─ home-manager
#      └─ default.nix *
#
{ config, pkgs, vars, ... }:

{
  home = {
    username = "${vars.user}";
    stateVersion = "23.11";
  };
  programs = { home-manager.enable = true; };

  imports = [
    ./helix.nix
    ./shell
    ./gpg.nix
    ./ssh.nix
    ./cli
  ];
}
