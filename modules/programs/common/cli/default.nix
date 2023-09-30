{ config, pkgs, lib, ... }:

{
  home = {
    packages = with pkgs; [
      mlocate
      tree
      fd
      mediainfo
      exiftool
      file
    ];
  };

  imports = [
    ./fzf.nix
    ./ripgrep.nix
    ./bat.nix
    ./broot.nix
    ./zoxide.nix
    ./yazi.nix
    ./eza.nix
    ./btop.nix
    ./direnv.nix
    ./lazygit.nix
    ./yt-dlp.nix
    ./cmus.nix
  ];
}
