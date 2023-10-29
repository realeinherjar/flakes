{ config, lib, pkgs, inputs, ... }:

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
      inputs.agenix.packages.${system}.default

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