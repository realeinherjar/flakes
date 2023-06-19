{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      transmission-gtk
    ];
  };
}
