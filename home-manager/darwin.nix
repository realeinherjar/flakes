#  Specific home-manager configuration settings for MacOS
#
#  flake.nix
#   └─ home-manager
#      ├─ default.nix
#      └─ darwin.nix *
#

{ config, pkgs, vars, ... }:

{
  home = {
    homeDirectory = "/Users/${vars.user}";

    file = {
      # Fish
      ".config/fish/fish_variables".text = (builtins.readFile ./shell/fish/fish_variables.nix) +
        ''
          SETUVAR fish_user_paths:/Users/${vars.user}/\x2ecargo/bin\x1e/opt/homebrew/bin\x1e/Users/${vars.user}/\x2enix\x2dprofile/bin
        '';
      ".config/fish/functions/nix_update.fish".text = import ./shell/fish/functions/nix_update.nix;
    };
  };
}
