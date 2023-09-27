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
