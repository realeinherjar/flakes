{ config, pkgs, ... }:
{
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github" = {
        hostname = "github.com";
        forwardX11 = false;
        forwardX11Trusted = false;
      };
      "gitlab" = {
        hostname = "gitlab.com";
        forwardX11 = false;
        forwardX11Trusted = false;
      };
    };
  };
}

