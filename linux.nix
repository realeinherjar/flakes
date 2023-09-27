{ pkgs, ... }:
{
  # TODO: Put your /etc/nixos/hardware-configuration.nix here
  boot.loader.grub.device = "nodev";
  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "btrfs";
  };
  system.stateVersion = "23.11";
  services.netdata.enable = true;
}
