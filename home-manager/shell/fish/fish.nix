#  Helix home-manager configuration settings
#
#  flake.nix
#   └─ home-manager
#      ├─ default.nix
#      └─ shell
#         ├─ default.nix
#         └─ fish
#            └─ fish.nix *
#

{ lib, pkgs, vars, ... }:

{
  programs.fish = {
    enable = true;
  };

  home.file = {
    ".config/fish/functions/br.fish".text = import ./functions/br.nix;
    ".config/fish/functions/e.fish".text = import ./functions/e.nix;
    ".config/fish/functions/einherjar.fish".text = import ./functions/einherjar.nix;
    ".config/fish/functions/fzf.fish".text = import ./functions/fzf.nix;
    ".config/fish/functions/g.fish".text = import ./functions/g.nix;
    ".config/fish/functions/l.fish".text = import ./functions/l.nix;
    ".config/fish/functions/ls.fish".text = import ./functions/l.nix;
    ".config/fish/functions/nf.fish".text = import ./functions/nf.nix;
    ".config/fish/functions/r.fish".text = import ./functions/r.nix;
    ".config/fish/functions/rename_metadata.fish".text = import ./functions/rename_metadata.nix;
    ".config/fish/functions/testtor.fish".text = import ./functions/testtor.nix;
    ".config/fish/functions/top.fish".text = import ./functions/top.nix;
    ".config/fish/functions/vi.fish".text = import ./functions/vi.nix;
    ".config/fish/functions/yt.fish".text = import ./functions/yt.nix;
    ".config/fish/functions/yta.fish".text = import ./functions/yta.nix;
    ".config/fish/functions/ytp.fish".text = import ./functions/ytp.nix;
    ".config/fish/functions/fish_prompt.fish".source = ./functions/fish_prompt.fish;
  };
}
