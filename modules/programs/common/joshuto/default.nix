{ pkgs, config, ... }:
{
  home.file.".config/joshuto".source = ./config;
}
