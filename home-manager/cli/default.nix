#  Common home-manager configuration settings
#
#  flake.nix
#   └─ home-manager
#      ├─ default.nix
#      └─ cli
#         └─ default.nix *
#

{ config, pkgs, vars, ... }:

{
  imports = [
    ./fzf.nix
    ./ripgrep.nix
    ./bat.nix
    ./zoxide.nix
    ./yazi.nix
    ./eza.nix
    ./btop.nix
    # ./direnv.nix
    # ./yt-dlp
  ];
}
