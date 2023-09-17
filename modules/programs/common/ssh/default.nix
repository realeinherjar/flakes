{ config, pkgs, ... }: {
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
      "onion" = {
        hostname = "*.onion";
        proxyCommand = "nc -xlocalhost:9050 %h %p";
      };
      "all" = {
        hostname = "*";
        forwardAgent = true;
        forwardX11 = true;
        IdentityFile = [ "~/.ssh/id_ed25519" "~/.ssh/id_einherjar" ];
      };
    };
  };
}

