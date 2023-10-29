{ config, lib, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      gdb
      parallel
      du-dust
      lazydocker
      # langs
      rust-bin.stable.latest.default
      cargo-nextest
      cargo-cache
      cargo-show-asm
      llvm
      python3
      go

      # git
      gh
      git-absorb

      # age
      age-plugin-yubikey
      age
      agenix

      # archive
      xz
      zstd
      lz4
      p7zip
      cryptomator

      # tor
      torsocks
    ];
  };
}
