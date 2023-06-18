{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      mlocate
      tree
      fd
      ripgrep
      exa
      mediainfo
      exiftool
      file
    ];
  };
  programs = {
    fzf = {
      enable = true;
      enableFishIntegration = true;
    };
    bat = {
      enable = true;
      config = {
        italic-text = "always";
        theme = "catppuccin";
      };
      themes = {
        catppuccin = builtins.readFile (pkgs.fetchurl {
          url = "https://github.com/catppuccin/bat/raw/main/Catppuccin-mocha.tmTheme";
          sha256 = "a8c40d2466489a68ebab3cbb222124639221bcf00c669ab45bab242cbb2783fc";
        });
      };
    };
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
