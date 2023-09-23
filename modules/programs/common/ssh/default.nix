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
        identityFile = [ "~/.ssh/id_ed25519" ];
      };
    };
  };
  home.file.".ssh/know_hosts".text = ''
    github.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl
    gitlab.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAfuCHKVTjquxvt6CM6tdG4SLp1Btn/nOeHHE5UOzRdf
  '';
}

