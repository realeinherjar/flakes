{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      cava
      cmus
      opustags
    ];
  };
  home.file.".config/cmus/rc".text = ''
    bind -f common ^T push run opustags -s FIELD=VALUE -i {}
  '';
}
