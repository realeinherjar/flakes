{ config, lib, pkgs, user, impermanence, ... }:

{
  imports = [ (import ../../../modules/desktop/hyprland/home.nix) ]
    ++ [ (import ../../../modules/scripts) ]
    ++ (import ../../../modules/shell)
    ++ (import ../../../modules/editors)
    ++ (import ../../../modules/programs/wayland)
    ++ (import ../../../modules/theme/catppuccin-dark/wayland);

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
  };
  programs = { home-manager.enable = true; };

  home.stateVersion = "23.11";

  # Wallpapers
  home.file."wallpaper".source = ./wallpaper;
}

