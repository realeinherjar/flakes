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
        plain = true;
        italic_text = true;
        theme = "catppuccin";
      };
      themes = {
        catppuccin = builtins.readFile (pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "bat";
          rev = "477622171ec0529505b0ca3cada68fc9433648c6";
          sha256 = "a8c40d2466489a68ebab3cbb222124639221bcf00c669ab45bab242cbb2783fc";
        } + "/Catppuccin-mocha.tmTheme");
      };
    };
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
