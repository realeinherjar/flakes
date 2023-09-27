#  Specific system configuration settings for MacBook
#
#  flake.nix
#   └─ ./fonts.nix *
#
{ config, pkgs, vars, ... }:

{
  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      font-awesome
      (nerdfonts.override {
        fonts = [
          "Noto"
        ];
      })
    ];
  };
}
