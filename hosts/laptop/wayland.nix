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
  users.mutableUsers = false;
  users.users.root.initialHashedPassword =
    "$6$MaOkIaWVTcGTX0Ec$5trnAnfzqMYsoggvBbjBcP.SPxx/B1fqsQxLfKU26QMerrG0QmRnaofCT3/K0LBk9aLeiPDjledO7Sdh9yv161";
  programs.fish.enable = true;
  users.users.${vars.user} = {
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
      # sparrow # not updated frequently, get the standalone binary from the repo
      # bisq-desktop
      libreoffice-fresh
      qpwgraph
      playerctl
      xfce.thunar
      xfce.thunar-archive-plugin
    ]);
  };
  boot = {
    supportedFilesystems = [ "ntfs" ];
    kernelPackages = pkgs.linuxPackages_latest;
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
    kernelParams = [
      "quiet"
      "splash"
      # framework specific ones
      "mem_sleep_default=deep" # better battery life
      "nvme.noacpi=1" # better battery life for NVME
      "usbcore.quirks=0bda:8156:k" # framework ethernet port not responding after sleep
    ];
    blacklistedKernelModules = [
      # Bluetooth
      "btusb"
      "bnep"
      "bluetooth"
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
        "/etc/mullvad-vpn"
        "/var/log"
        "/var/lib"
      ];
      users.${vars.user} = {
        directories = [
          ".cache"
          ".config"
          ".local"
          ".cargo"
          ".npm-global"
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
      sshpass
      lxappearance
      imagemagick
      sway-contrib.grimshot
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
    getty.autologinUser = "${vars.user}";
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

  security = {
    rtkit.enable = true;
    polkit.enable = true;
    sudo = {
      enable = false;
      extraConfig = ''
        ${vars.user} ALL=(ALL) NOPASSWD:ALL
      '';
    };
    doas = {
      enable = true;
      extraConfig = ''
        permit nopass :wheel
      '';
    };
  };
}