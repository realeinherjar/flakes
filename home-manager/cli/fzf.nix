#  Common home-manager configuration settings
#
#  flake.nix
#   └─ home-manager
#      ├─ default.nix
#      └─ cli
#         ├─ default.nix
#         └─ fzf.nix *
#
{ config, pkgs, vars, ... }:

{
  programs = {
    fzf = {
      enable = true;
      enableFishIntegration = true;
      tmux.enableShellIntegration = true;
    };
  };
}
