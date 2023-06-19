{ config, pkgs, ... }:
{
  services.mako = {
    enable = true;
    defaultTimeout = 30000; # milliseconds
  };
}
