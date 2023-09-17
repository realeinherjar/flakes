{ lib, pkgs, user, ... }:

{
  programs.fish = {
    enable = true;
    loginShellInit = ''
      # set TTY1 (tty)
      # [ "$TTY1" = "/dev/tty1" ] && exec dbus-run-session sway --unsupported-gpu
       set TTY1 (tty)
       [ "$TTY1" = "/dev/tty1" ] && exec dbus-run-session Hyprland
    '';
  };
  home.file.".config/fish/fish_variables".text = import ./fish_variables.nix;
  home.file.".config/fish/functions/br.fish".text = import ./functions/br.nix;
  home.file.".config/fish/functions/e.fish".text = import ./functions/e.nix;
  home.file.".config/fish/functions/einherjar.fish".text =
    import ./functions/einherjar.nix;
  home.file.".config/fish/functions/fzf.fish".text = import ./functions/fzf.nix;
  home.file.".config/fish/functions/g.fish".text = import ./functions/g.nix;
  home.file.".config/fish/functions/l.fish".text = import ./functions/l.nix;
  home.file.".config/fish/functions/n.fish".text = import ./functions/n.nix;
  home.file.".config/fish/functions/r.fish".text = import ./functions/r.nix;
  home.file.".config/fish/functions/rename_metadata.fish".text =
    import ./functions/rename_metadata.nix;
  home.file.".config/fish/functions/ls.fish".text = import ./functions/ls.nix;
  home.file.".config/fish/functions/nf.fish".text = import ./functions/nf.nix;
  home.file.".config/fish/functions/ssh-agent.fish".text =
    import ./functions/ssh-agent.nix;
  home.file.".config/fish/functions/owf.fish".text = import ./functions/owf.nix;
  home.file.".config/fish/functions/vi.fish".text = import ./functions/vi.nix;
  home.file.".config/fish/functions/testtor.fish".text =
    import ./functions/testtor.nix;
  home.file.".config/fish/functions/top.fish".text = import ./functions/top.nix;
  home.file.".config/fish/functions/xdg-get.fish".text =
    import ./functions/xdg-get.nix;
  home.file.".config/fish/functions/xdg-set.fish".text =
    import ./functions/xdg-set.nix;
  home.file.".config/fish/functions/yt.fish".text = import ./functions/yt.nix;
  home.file.".config/fish/functions/yta.fish".text = import ./functions/yta.nix;
  home.file.".config/fish/functions/ytp.fish".text = import ./functions/ytp.nix;
  home.file.".config/fish/functions/fish_prompt.fish".source =
    ./functions/fish_prompt.fish;
}
