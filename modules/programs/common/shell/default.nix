{ config, pkgs, lib, ... }:

{
  imports = [
    ./fish
    ./git.nix
    ./bash.nix
    ./tmux.nix
  ];
}
