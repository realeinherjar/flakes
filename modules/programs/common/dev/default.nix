{ config, lib, pkgs, ... }:

let
  rust = pkgs.rust-bin.stable.latest.default.override {
    targets = [ "wasm32-unknown-unknown" ];
  };
in

{
  home.packages = with pkgs; [
    gdb
    parallel
    du-dust
    lazydocker
    just
    fastfetch
    # langs
    rust
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
}
