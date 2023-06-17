{ config, pkgs, ... }:

{
  programs = {
    kitty = {
      enable = true;
      environment = { };
      keybindings = {
        "ctrl+shift+/" = "remote_control select-window --response-timeout=3";
      };
      settings = {
        shell = "fish";
        enable_audio_bell = false;
        allow_remote_control = true;
        listen_on = "unix:/tmp/mykitty";
      };
    };
  };
}
