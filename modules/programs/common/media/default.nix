{ config, lib, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      mediainfo
      exiftool
      cmus
      ffmpeg
      qpdf
      graphicsmagick
      aria2
      pandoc
      glow
      tectonic
      typst
      mat2
    ];
  };
}
