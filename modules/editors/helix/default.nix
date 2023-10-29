{ config, pkgs, lib, ... }:

{
  programs = {
    helix = {
      enable = true;
      defaultEditor = true;
      settings = {
        theme = "catppuccin_mocha";

        editor = {
          line-number = "relative";
          mouse = true;
          scrolloff = 8;
          rulers = [ 80 ];
          true-color = true;
          color-modes = true;
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
            left = [ "mode" "spinner" "version-control" ];
            center = [ "file-name" ];
            right = [ "diagnostics" "selections" "position-percentage" "position" "file-encoding" "file-line-ending" "file-type" ];
            separator = "│";
            mode.normal = "NORMAL";
            mode.insert = "INSERT";
            mode.select = "SELECT";
          };
          indent-guides = {
            render = true;
          };
          lsp = {
            display-messages = true;
            display-inlay-hints = true;
          };
        };
        keys = {
          normal = {
            esc = [ "collapse_selection" "keep_primary_selection" ];
            X = [ "extend_line_up" "extend_to_line_bounds" ];
            A-x = "extend_to_line_bounds";
            A-j = [ "ensure_selections_forward" "extend_to_line_bounds" "extend_char_right" "extend_char_left" "delete_selection" "add_newline_below" "move_line_down" "replace_with_yanked" ];
            A-k = [ "ensure_selections_forward" "extend_to_line_bounds" "extend_char_right" "extend_char_left" "delete_selection" "move_line_up" "add_newline_above" "move_line_up" "replace_with_yanked" ];

            space = {
              w = ":write";
              q = ":quit";
            };
          };
          select = {
            X = [ "extend_line_up" "extend_to_line_bounds" ];
            A-x = "extend_to_line_bounds";
          };
        };
      };
    };
  };
  home = {
    packages = with pkgs; [
      # LSPs
      nil
      nodePackages_latest.bash-language-server
      nodePackages_latest.vscode-langservers-extracted
      rust-analyzer
      marksman
      taplo
      ruff
      ruff-lsp
      gopls
      yaml-language-server
      texlab
      ltex-ls
      typst-lsp
      # tree-sitter
      tree-sitter
      # debugger
      lldb # provides lldb-vscode
      # formatter
      nixpkgs-fmt
      black
      dprint
    ];
    file.".config/helix/languages.toml".source = ./languages.toml;
  };
}
