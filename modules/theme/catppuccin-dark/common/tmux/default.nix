{ config, pkgs, ... }:

{
  home.file.".config/tmux/catppuccin.tmux".source = ./catppuccin.nix;
  home.file.".config/tmux/catppuccin-mocha.tmuxtheme".source = ./catppuccin-mocha.nix;
}

