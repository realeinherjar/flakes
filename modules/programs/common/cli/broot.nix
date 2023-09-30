{ config, pkgs, lib, ... }:

{
  programs = {
    broot = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
