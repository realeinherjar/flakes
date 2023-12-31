{ config, pkgs, lib, user, inputs, ... }:

let
  user = "einherjar";
  domain = "laptop";
in
{
  imports = (import ../../../modules/hardware)
    ++ (import ../../../modules/virtualisation)
    ++ [ ../hardware-configuration.nix ../../../modules/fonts ]
    ++ [ ../../../modules/desktop/hyprland ];

  age.identityPaths = [ "/home/${user}/.ssh/id_ed25519" ];
  age.secrets = {
    password.file = ../../../secrets/password.age;
    fiatpassword.file = ../../../secrets/fiatpassword.age;
    reserves1.file = ../../../secrets/reserves1.age;
    reserves2.file = ../../../secrets/reserves2.age;
  };

  users.mutableUsers = false;
  users.users.root.initialHashedPassword =
    "$6$MaOkIaWVTcGTX0Ec$5trnAnfzqMYsoggvBbjBcP.SPxx/B1fqsQxLfKU26QMerrG0QmRnaofCT3/K0LBk9aLeiPDjledO7Sdh9yv161";
  programs.fish.enable = true;
  networking.hostName = "${domain}";
  users.users.${user} = {
    initialHashedPassword =
      "$6$MaOkIaWVTcGTX0Ec$5trnAnfzqMYsoggvBbjBcP.SPxx/B1fqsQxLfKU26QMerrG0QmRnaofCT3/K0LBk9aLeiPDjledO7Sdh9yv161";
    shell = pkgs.fish;
    isNormalUser = true;
    extraGroups =
      [ "wheel" "docker" "libvirtd" "video" "audio" "networkmanager" ];
    packages = (with pkgs; [
      keepassxc
      tor-browser-bundle-bin
      signal-desktop
      sparrow
      bisq-desktop
      libreoffice-fresh
      qpwgraph
      playerctl
    ]) ++ (with config.nur.repos;
      [
        # nur packages
        # https://nur.nix-community.org/
      ]);
  };
  boot = {
    supportedFilesystems = [ "ntfs" ];
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    loader = {
      systemd-boot = {
        enable = true;
        consoleMode = "auto";
        configurationLimit = 20;
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      timeout = 3;
    };

    # Fix WiFi speeds
    extraModprobeConfig = ''
      options cfg80211 ieee80211_regdom="US"
    '';

    blacklistedKernelModules = [
      # Bluetooth
      # "btusb"
      # "bnep"
      # "bluetooth"
      "hid_sensor_hub" # give me back by brightness keys
    ];
    consoleLogLevel = 0;
    initrd.verbose = false;
  };

  environment = {
    persistence."/nix/persist" = {
      directories = [
        "/etc/nixos" # bind mounted from /nix/persist/etc/nixos to /etc/nixos
        "/etc/NetworkManager/system-connections"
        "/etc/wireguard"
        "/var/log"
        "/var/lib"
      ];
      users.${user} = {
        directories = [
          ".cache"
          ".config"
          ".local"
          ".cargo"
          {
            directory = ".gnupg";
            mode = "0700";
          }
          {
            directory = ".ssh";
            mode = "0700";
          }
          ".mozilla"
          "git"
          "dev"
          "music"
          "videos"
        ];
        files = [
          # put files here
        ];
      };
    };
    systemPackages = with pkgs; [
      libnotify
      wl-clipboard
      wlr-randr
      wayland
      wayland-scanner
      wayland-utils
      egl-wayland
      wayland-protocols
      pkgs.xorg.xeyes
      glfw-wayland
      xwayland
      pkgs.qt6.qtwayland
      cinnamon.nemo
      networkmanagerapplet
      wev
      wf-recorder
      alsa-lib
      alsa-utils
      flac
      pulsemixer
      linux-firmware
      polkit_gnome
      sshpass
      lxappearance
      imagemagick
      pkgs.sway-contrib.grimshot
      grim
      simple-mtpfs
      brightnessctl
      keyd
    ];
  };

  services.xserver = {
    layout = "us";
    xkbVariant = "colemak";
    xkbOptions = "caps:escape";
    autoRepeatDelay = 200;
    autoRepeatInterval = 30;
  };
  console.useXkbConfig = true;

  services = {
    dbus.packages = [ pkgs.gcr ];
    getty.autologinUser = "${user}";
    gvfs.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
    tor.client.enable = true;
    keyd = {
      enable = true;
      keyboards = {
        default = {
          ids = [ "*" ];
          settings = {
            main = {
              # Maps capslock to escape when pressed and control when held
              capslock = "overload(control, esc)";
            };
          };
        };
      };
    };
  };

  security.rtkit.enable = true;
  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };
  security.polkit.enable = true;
  security.sudo = {
    enable = false;
    extraConfig = ''
      ${user} ALL=(ALL) NOPASSWD:ALL
    '';
  };
  security.doas = {
    enable = true;
    extraConfig = ''
      permit nopass :wheel
    '';
  };

}
