#
#  Specific system configuration settings for MacBook
#
#  flake.nix
#   └─ ./packages.nix *
#
{ config, pkgs, vars, ... }:

{
  environment = {
    shells = with pkgs; [ fish ]; # Default Shell

    variables = {
      # Environment Variables
      EDITOR = "${vars.editor}";
      VISUAL = "${vars.editor}";
    };

    systemPackages = with pkgs; [
      # System-Wide Packages
      # Terminal
      tree
      fzf
      fd
      ripgrep
      parallel
      tmux
      gnupg
      curl
      rsync
      jq
      just

      # git
      git
      lazygit
      gh

      # ssh
      openssh
      ssh-copy-id

      # archive
      xz
      zstd
      lz4
      p7zip

      # tor
      tor
      torsocks

      # programming
      rustup
      go
      python3
      llvm
      pipx
      typescript
      nodejs # provides npm

      # editor/LSPs
      helix
      marksman
      deno
      cmus
      ruff
      ruff-lsp
      black
      yaml-language-server
      nodePackages.bash-language-server
      taplo

      # media
      ffmpeg
      graphicsmagick
      aria2
      yt-dlp
      pandoc
      tectonic
      typst
    ];
  };
}