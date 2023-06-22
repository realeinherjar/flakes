{ config, lib, pkgs, ... }:

{
  programs = {
    neovim = {
      enable = true;
      withPython3 = true;
      withNodeJs = true;
      extraPackages = [
      ];
      #-- Plugins --#
      plugins = with pkgs.vimPlugins;[ ];
      #-- --#
    };
  };
  home = {
    packages = with pkgs; [
      # functionalities
      luajitPackages.luarocks
      deno
      lazygit
      # LSPs
      nodePackages_latest.bash-language-server
      nodePackages_latest.dockerfile-language-server-nodejs
      clang-tools
      nodePackages_latest.vscode-langservers-extracted
      gopls
      lua-language-server
      marksman
      nil
      pyright
      rust-analyzer
      texlab
      nodePackages_latest.typescript-language-server
      typst-lsp
      nodePackages.yaml-language-server
      # tree-sitter
      tree-sitter
      # format
      stylua
      black
      isort
      nixpkgs-fmt
      rustfmt
      beautysh
      shfmt
      nodePackages.prettier
      # linters
      shellcheck
      shellharden
      luajitPackages.luacheck
      ruff
      nodePackages.markdownlint-cli
      proselint
      alex
      nodePackages.write-good
      # debug
      lldb
    ];
  };
}
