{ lib, pkgs, user, ... }:

{
  home.file.".config/tmux/catppuccin.tmux".text = import ./catppuccin.tmux;
  home.file.".config/tmux/catppuccin-mocha.tmuxtheme".text = import ./catppuccin-mocha.tmuxtheme;
}

