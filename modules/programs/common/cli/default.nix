{ config, pkgs, lib, ... }:

{
  home = {
    packages = with pkgs; [
      mlocate
      tree
      fd
      sd
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
    ./ncdu.nix
    ./btop.nix
    ./bottom.nix
    ./direnv.nix
    ./lazygit.nix
    ./yt-dlp.nix
    ./cmus.nix
  ];
}
