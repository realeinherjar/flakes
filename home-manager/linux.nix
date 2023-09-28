#  Specific home-manager configuration settings for NixOS
#
#  flake.nix
#   └─ home-manager
#      ├─ default.nix
#      └─ linux.nix *
#

{ config, pkgs, vars, ... }:

{
  home = {
    homeDirectory = "/home/${vars.user}";

    file = {
      # Wallpapers
      "wallpaper".source = ../hosts/wallpaper;
      # Fish
      ".config/fish/fish_variables".text = (builtins.readFile ./shell/fish/fish_variables.nix) +
        ''
          SETUVAR fish_user_paths:/home/${vars.user}/\x2enpm\x2dglobal/bin\x1e/home/${vars.user}/\x2ecargo/bin
        '';
      ".config/fish/functions/xdg-get.fish".text = import ./shell/fish/functions/xdg-get.nix;
      ".config/fish/functions/xdg-set.fish".text = import ./shell/fish/functions/xdg-set.nix;
      ".config/fish/functions/ssh-agent.fish".text = import ./shell/fish/functions/ssh-agent.nix;
    };
  };
}
