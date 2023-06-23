{ lib, pkgs, user, ... }:

{
  home = {
    packages = with pkgs; [
      sops
    ];
  };
  home.file.".sops.yaml".text = ''
  creation_rules:
    - pgp: >-
        BF60A6993831D40198284A3BE7ED7E35F072CA83
  '';
}
