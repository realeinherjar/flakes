{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      bitcoin
    ];
  };
}
