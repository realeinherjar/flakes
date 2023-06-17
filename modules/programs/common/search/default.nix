{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      mlocate
      tree
      fd
      bat
      ripgrep
      exa
      mediainfo
      exiftool
      file
    ];
  };
  programs = {
    fzf = {
      enable = true;
      enableFishIntegration = true;
    };
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
