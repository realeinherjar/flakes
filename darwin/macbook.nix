#  Specific system configuration settings for MacBook
#
#  flake.nix
#   └─ ./darwin
#       ├─ default.nix
#       └─ macbook.nix *
#

{ config, pkgs, vars, ... }:

{
  imports = [
    ../packages.nix
    ../fonts.nix
    ../home-manager
    ./brew.nix
    ./packages.nix
  ];

  users.users.${vars.user} = {
    # MacOS User
    home = "/Users/${vars.user}";
    shell = pkgs.fish; # Default Shell
  };

  networking = {
    computerName = "macbook";
    hostName = "macbook";
    localHostName = "macbook";
  };

  environment.etc."hosts" = {
    copy = true;
    text = builtins.readFile (builtins.fetchurl {
      url = "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews/hosts";
      sha256 = "2d6dbd81f8adfea68e0ed5fb32aea72b78a8ba41ee4bbb0e8882c29eb614186a";
    });
  };

  services = {
    nix-daemon.enable = true; # Auto-Upgrade Daemon
  };

  nix = {
    package = pkgs.nix;
    gc = {
      # Garbage Collection
      automatic = true;
      interval.Day = 7;
      options = "--delete-older-than 7d";
    };
    extraOptions = ''
      auto-optimise-store = true
      experimental-features = nix-command flakes
    '';
  };

  system = {
    # Global macOS System Settings
    defaults = {
      NSGlobalDomain = {
        KeyRepeat = 1;
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
      };
      dock = {
        autohide = true;
        orientation = "bottom";
        showhidden = true;
        tilesize = 40;
      };
      finder = {
        QuitMenuItem = false;
      };
      trackpad = {
        Clicking = true;
        TrackpadRightClick = true;
      };
    };
    # Set Default Shell
    activationScripts.postActivation.text = ''sudo chsh -s ${pkgs.fish}/bin/fish'';
    stateVersion = 4;
  };
}
