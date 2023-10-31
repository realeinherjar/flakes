{ config, lib, pkgs, inputs, ... }:
{
  imports = [ ../../programs/wayland/waybar/hyprland_waybar.nix ];


  programs = {
    dconf.enable = true;
    light.enable = true;
    hyprland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    grimblast
    hyprpicker
    swww
    swaylock-effects
    pamixer
  ];

  security.pam.services.swaylock = { };
  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };
}
