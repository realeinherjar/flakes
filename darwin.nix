# Your machine's configuration.nix goes here
{ pkgs, ... }:
{
  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
  security.pam.enableSudoTouchIdAuth = true;
}
