{ config, pkgs, lib, inputs, user, domain, ... }:

{
  nixpkgs.system = "x86_64-linux";

  nixpkgs.config.allowUnfree = true;

  zramSwap.enable = true;

  networking = {
    networkmanager.enable = true;
    wireguard.enable = true;
    iproute2.enable = true;
    stevenblack = {
      enable = true;
      block = [ "fakenews" ];
    };
    firewall = {
      enable = true;
      allowedTCPPorts = [
        51413 # transmission
      ];
      allowedUDPPorts = [
        51413 # transmission
      ];
    };

  };

  time.timeZone = "America/Sao_Paulo";

  i18n.defaultLocale = "en_US.UTF-8";

  security.rtkit.enable = true;

  services = {
    dbus.enable = true;
    locate = {
      enable = true;
      prunePaths = [ "/tmp" "/var/cache" "/var/lock" "/var/run" "/var/spool" ];
      interval = "hourly";
      locate = pkgs.mlocate;
      localuser = null;
    };
    openssh = { enable = false; };
    fstrim.enable = true;
    fwupd.enable = true;
    tor.enable = true;
  };

  environment = {
    binsh = "${pkgs.dash}/bin/dash";
    shells = with pkgs; [ fish ];
    systemPackages = with pkgs; [
      git
      gnupg
      docker
      curl
      wget
      rsync
      neofetch
      gcc
      clang
      cargo
      detox
      p7zip
      atool
      unzip
      ffmpeg
      ffmpegthumbnailer
      glib
      xdg-utils
      pciutils
      gdb
      killall
      nodejs
      julia-bin
      python3
      go
      typescript
      socat
      zip
      rar
      frp
      zathura
      nix-index
      # custom
      bc
      gnumake
      exfat
      parallel
      ncdu
      du-dust
      broot
      gh
      unar
      lazydocker
      aria2
      tectonic
      typst
      glow
      tor
      torsocks
      cryptomator
      wireguard-tools
      openresolv
      sc-im
      qpdf
      pandoc
      mat2
    ];
    etc = {
      "NetworkManager/conf.d/wifi_rand_mac.conf" = {
        text = ''
          [device-mac-randomization]
          # "yes" is already the default for scanning
          wifi.scan-rand-mac-address=yes

          [connection-mac-randomization]
          # Randomize MAC for every ethernet connection
          #ethernet.cloned-mac-address=random
          # Generate a random MAC ethernet connection
          ethernet.cloned-mac-address=stable
          # Generate a randomized value upon each connection
          #wifi.cloned-mac-address=random
          # Generate a random MAC for each WiFi and associate the two permanently
          wifi.cloned-mac-address=stable
        '';
        mode = "0400";
      };
    };
  };

  nix = {
    settings = {

      substituters = [ "https://cache.nixos.org/" ];
      auto-optimise-store = true; # Optimise syslinks
    };
    # Set the $NIX_PATH entry for nixpkgs. This is necessary in
    # this setup with flakes, otherwise commands like `nix-shell
    # -p pkgs.htop` will keep using an old version of nixpkgs.
    # With this entry in $NIX_PATH it is possible (and
    # recommended) to remove the `nixos` channel for both users
    # and root e.g. `nix-channel --remove nixos`. `nix-channel
    # --list` should be empty for all users afterwards
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 2d";
    };
    package = pkgs.nixVersions.unstable;
    registry.nixpkgs.flake = inputs.nixpkgs;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs          = true
      keep-derivations      = true
    '';
  };

  system = {
    autoUpgrade = {
      enable = false;
      channel = "https://nixos.org/channels/nixos-unstable";
    };
    stateVersion = "23.11";
  };
}
