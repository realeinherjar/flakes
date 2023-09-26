{ config, lib, pkgs, ... }:

{
  programs = {
    helix = {
      enable = true;
      settings = {
        theme = "catppuccin_mocha";

        editor = {
          line-number = "relative";
          mouse = false;
          scrolloff = 8;
          rulers = [80];
          true-color = true;
          bufferline = "multiple";
          cursor-shape = {
            insert = "bar";
            normal = "block";
            select = "underline";
          };
          file-picker = {
            hidden = false;
          };
          statusline = {
            left = ["mode" "spinner" "version-control"];
            center = ["file-name"];
            right = ["diagnostics" "selections" "position" "file-encoding" "file-line-ending" "file-type"];
            separator = "│";
            mode.normal = "NORMAL";
            mode.insert = "INSERT";
            mode.select = "SELECT";
          };
          lsp = {
            display-messages = true;
            display-inlay-hints = true;
          };
        };
        keys = {
          normal = {
            esc = ["collapse_selection" "keep_primary_selection"];
            X = ["extend_line_up" "extend_to_line_bounds"];
            "A-x" = "extend_to_line_bounds";
            space = {
              w = ":write";
              q = ":quit";
            };
          };
          select = {
            X = ["extend_line_up" "extend_to_line_bounds"];
            "A-x" = "extend_to_line_bounds";
          };
        };
      };
    };
  };
  home = {
    packages = with pkgs; [
      # git
      lazygit
      # LSPs
      nil
      nodePackages_latest.bash-language-server
      nodePackages_latest.vscode-langservers-extracted
      lua-language-server
      python311Packages.python-lsp-server
      rust-analyzer
      nodePackages_latest.typescript-language-server
      marksman
      # tree-sitter
      tree-sitter
      # debugger
      lldb # provides lldb-vscode
    ];
  };
}
