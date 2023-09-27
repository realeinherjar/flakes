#  Specific system configuration settings for laptop
#
#  flake.nix
#   └─ ./hosts
#       ├─ default.nix
#       └─ ./laptop
#            ├─ default.nix *
#            └─ hardware-configuration.nix

{ lib, pkgs, host, inputs, vars, ... }:

{
  # TODO: add a swap device
  zramSwap.enable = true;

  networking = with host; {
    hostName = hostName;
    networkmanager.enable = true;
    wireguard.enable = true;
    iproute2.enable = true; # Needed for mullvad daemon
    stevenblack = {
      enable = true;
      block = [ "fakenews" ];
    };
    firewall = {
      enable = true;
      allowedTCPPorts = [
        443 # mullvad-daemon
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
    mullvad-vpn.enable = true;
  };

  environment.etc = {
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
  nix = {
    # Nix Package Manager Settings
    settings = {
      auto-optimise-store = true;
    };
    gc = {
      # Garbage Collection
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 2d";
    };
    package = pkgs.nixVersions.unstable; # Enable Flakes
    registry.nixpkgs.flake = inputs.nixpkgs;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs          = true
      keep-derivations      = true
    '';
  };
  nixpkgs.config.allowUnfree = true; # Allow Proprietary Software.

  system = {
    autoUpgrade = {
      enable = false;
      channel = "https://nixos.org/channels/nixos-unstable";
    };
    stateVersion = "23.11";
  };
}
