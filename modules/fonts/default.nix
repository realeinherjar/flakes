{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ twemoji-color-font ];
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-emoji
      nerdfonts
      twemoji-color-font
    ];
  };
}
