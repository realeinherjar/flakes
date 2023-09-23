{ config, lib, pkgs, user, impermanence, ... }:

{
  imports = [ (import ../../../modules/desktop/hyprland/home.nix) ]
    ++ [ (import ../../../modules/scripts) ] ++ (import ../../../modules/shell)
    ++ (import ../../../modules/editors)
    ++ (import ../../../modules/programs/wayland)
    ++ (import ../../../modules/theme/catppuccin-dark/wayland);

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
  };
  programs = {
    home-manager.enable = true;
    ssh = {
      knownHosts = {
        "github.com".publicKey =
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl";
        "gitlab.com".publicKey =
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAfuCHKVTjquxvt6CM6tdG4SLp1Btn/nOeHHE5UOzRdf";
      };
    };
  };

  home.stateVersion = "23.11";

  # Wallpapers
  home.file."wallpaper".source = ./wallpaper;
}

