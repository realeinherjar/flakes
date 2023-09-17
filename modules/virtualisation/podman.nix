{ config, pkgs, user, ... }:

{
  virtualisation = {
    podman = {
      enable = true;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;
    };
  };

  users.groups.docker.members = [ "${user}" ];

  environment.systemPackages = with pkgs; [ podman ];
}
