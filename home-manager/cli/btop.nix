#  Common home-manager configuration settings
#
#  flake.nix
#   └─ home-manager
#      ├─ default.nix
#      └─ cli
#         ├─ default.nix
#         └─ btop.nix *
#

{ config, lib, pkgs, vars, ... }:

{
  programs = {
    btop = {
      enable = true;
      settings = {
        color_theme = "catppuccin_mocha";
      };
    };
  };
  home.file.".config/btop/themes/catppuccin_mocha.theme".source = builtins.fetchurl {
    url =
      "https://github.com/catppuccin/btop/raw/main/themes/catppuccin_mocha.theme";
    sha256 =
      "4de6b101a766d38878739e5a5d851dcc7b4573ba5bd767b4c109828d2ca6bae8";
  };
}
