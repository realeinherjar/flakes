{ config, pkgs, ... }:

{
  home = {
    file.".config/obs-studio/themes".source = ./themes;

    packages = with pkgs; [ just ];
  };
  programs.obs-studio.enable = true;
}
