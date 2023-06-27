{ lib, pkgs, user, ... }:

{
  programs = {
    mpv = {
      enable = true;
    };
  };
  home.file.".config/mpv/mpv.conf".source = ./mpv.conf;
  home.file.".config/mpv/scripts/file_browser.lua".source = ./scripts/file_browser.lua;
  home.file.".config/mpv/scripts-opts/file_browser.conf".source = ./script-opts/file_browser.conf;
  home.file.".config/mpv/scripts/mpv_thumbnail_script_client_osc.lua".source = ./scripts/mpv_thumbnail_script_client_osc.lua;
  home.file.".config/mpv/scripts/mpv_thumbnail_script_server-1.lua".source = ./scripts/mpv_thumbnail_script_server-1.lua;
  home.file.".config/mpv/scripts/mpv_thumbnail_script_server-2.lua".source = ./scripts/mpv_thumbnail_script_server-2.lua;
  home.file.".config/mpv/scripts-opts/mpv_thumbnail_script.conf".source = ./script-opts/mpv_thumbnail_script.conf;
}
