{ config, lib, pkgs, ... }:

{
  programs = {
    neovim = {
      enable = true;
      withPython3 = true;
      withNodeJs = true;
      extraPackages = [ ];
      #-- Plugins --#
      plugins = with pkgs.vimPlugins; [ ];
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
      nodePackages_latest.vscode-langservers-extracted
      lua-language-server
      pyright
      rust-analyzer
      nodePackages_latest.typescript-language-server
      # tree-sitter
      tree-sitter
      # format
      stylua
      black
      isort
      nixpkgs-fmt
      rustfmt
      shfmt
      nodePackages.prettier
      # linters
      shellcheck
      shellharden
      codespell
      luajitPackages.luacheck
      ruff
      nodePackages.markdownlint-cli2
      proselint
      nodePackages.eslint
    ];
    file.".config/nvim".source = pkgs.fetchFromGitHub {
      owner = "realeinherjar";
      repo = "init.lua";
      rev = "v0.1.1";
      hash = "sha256-AuWdWk4esVcO22IiGsXbStTbwaFZ1ELTxAj9fd9fiPM=";
    };
  };
}
