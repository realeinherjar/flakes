{ config, pkgs, ... }:
{
  services.mako = {
    enable = true;
    defaultTimeout = 60;
  };
}
