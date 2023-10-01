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
      lua-language-server
      rust-analyzer
      nodePackages_latest.typescript-language-server
      marksman
      taplo
      ruff
      ruff-lsp
      yaml-language-server
      # tree-sitter
      tree-sitter
      # debugger
      lldb # provides lldb-vscode
      # formatter
      nixpkgs-fmt
      black
    ];
    file.".config/helix/languages.toml".text = ''
      [[language]]
      name = "rust"

      [language-server.rust-analyzer.config.check]
      command = "clippy"

      [language-server.rust-analyzer.config.cargo]
      features = "all"

      [[language]]
      name = "python"
      language-server = { command = "ruff-lsp" }
      formatter = { command = "black", args = ["--quiet", "-"] }
      auto-format = true

      [[language]]
      name = "toml"
      formatter = { command = "taplo", args = ["fmt", "-"] }
      auto-format = true

      [[language]]
      name = "yaml"

      [language-server.yaml-language-server.config.yaml]
      format = { enable = true }
      validation = true

      [language-server.yaml-language-server.config.yaml.schemas]
      "https://json.schemastore.org/github-workflow.json" = ".github/workflows/*.{yml,yaml}"
      "https://raw.githubusercontent.com/ansible-community/schemas/main/f/ansible-tasks.json" = "roles/{tasks,handlers}/*.{yml,yaml}"

      [[language]]
      name = "nix"
      formatter = { command = "nixpkgs-fmt" }
      auto-format = true

      [[language]]
      name = "fish"
      formatter = { command = "fish_indent" }
      auto-format = true

      [[language]]
      name = "julia"
      auto-format = true
      scope = "source.julia"
      injection-regex = "julia"
      file-types = ["jl"]
      roots = ["Project.toml", "Manifest.toml", "JuliaProject.toml"]
      comment-token = "#"
      language-server = { command = "julia", args = [
          "--project=@helix-lsp",
          "--startup-file=no",
          "--history-file=no",
          "--quiet",
          "/home/einherjar/.local/bin/julia-lsp.jl"
          ] }
      indent = { tab-width = 4, unit = "    " }
    '';
    file.".local/bin/julia-lsp.jl" = {
      # https://uncomfyhalomacro.pl/blog/14/
      text = ''
        import Pkg
        project_path = let
            dirname(something(
                Base.load_path_expand((
                    p = get(ENV, "JULIA_PROJECT", nothing);
                    isnothing(p) ? nothing : isempty(p) ? nothing : p
                )),
                Base.current_project(pwd()),
                Pkg.Types.Context().env.project_file,
                Base.active_project(),
            ))
        end
        ls_install_path = joinpath(get(DEPOT_PATH, 1, joinpath(homedir(), ".julia")), "environments", "helix-lsp");
        pushfirst!(LOAD_PATH, ls_install_path);
        using LanguageServer;
        popfirst!(LOAD_PATH);
        depot_path = get(ENV, "JULIA_DEPOT_PATH", "")
        symbol_server_path = joinpath(homedir(), ".cache", "helix", "julia_lsp_symbol_server")
        mkpath(symbol_server_path)
        server = LanguageServer.LanguageServerInstance(stdin, stdout, project_path, depot_path, nothing, symbol_server_path, true)
        server.runlinter = true
        run(server)
      '';
      executable = true;
    };
  };
}
