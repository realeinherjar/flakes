{ lib, pkgs, user, ... }:

{
  programs = { mpv = { enable = true; }; };
  home.file.".config/mpv/mpv.conf".source = ./mpv.conf;
  home.file.".config/mpv/scripts/file_browser.lua".source = builtins.fetchurl {
    url =
      "https://github.com/CogentRedTester/mpv-file-browser/raw/87b05d53493b98ff604eba81747f0e32f98dab43/file-browser.lua";
    sha256 = "a017d9a553d186de03b8bd273b2b4ac650f1150a5a2efb652fcbe3fb32c44c83";
  };
  home.file.".config/mpv/scripts-opts/file_browser.conf".source =
    builtins.fetchurl {
      url =
        "https://github.com/CogentRedTester/mpv-file-browser/raw/f1dd7f359da3d48d7b0234ec2a263efc2e2f8403/file_browser.conf";
      sha256 =
        "e216a749217ab9053bff4f36bc15e9ca9d0361c24a2fb1ff85e33e04f5dafc86";
    };
  home.file.".config/mpv/scripts/mpv_thumbnail_script_client_osc.lua".source =
    builtins.fetchurl {
      url =
        "https://github.com/marzzzello/mpv_thumbnail_script/releases/download/0.5.2/mpv_thumbnail_script_client_osc.lua";
      sha256 =
        "36bca9b679697236914b4969f470be52e306270e45f47cce6bfaff9943e44b68";
    };
  home.file.".config/mpv/scripts/mpv_thumbnail_script_server-1.lua".source =
    builtins.fetchurl {
      url =
        "https://github.com/marzzzello/mpv_thumbnail_script/releases/download/0.5.2/mpv_thumbnail_script_server.lua";
      sha256 =
        "d8f37051ff18e3a1957abb463c8462ec7e302edcdf07154396a878af0f2d10e7";
    };
  home.file.".config/mpv/scripts/mpv_thumbnail_script_server-2.lua".source =
    builtins.fetchurl {
      url =
        "https://github.com/marzzzello/mpv_thumbnail_script/releases/download/0.5.2/mpv_thumbnail_script_server.lua";
      sha256 =
        "d8f37051ff18e3a1957abb463c8462ec7e302edcdf07154396a878af0f2d10e7";
    };
  home.file.".config/mpv/scripts-opts/mpv_thumbnail_script.conf".source =
    ./script-opts/mpv_thumbnail_script.conf;
}
