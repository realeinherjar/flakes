{
  programs = {
    git = {
      enable = true;
      userName = "Einherjar";
      userEmail = "realeinherjar@proton.me";
      signing = {
        key = "0xE7ED7E35F072CA83!";
        signByDefault = true;
      };
      aliases = {
        acp = "!f() { git add . && git commit -m \"$@\" && git push origin HEAD; }; f";
	      a = "add";
	      br = "branch";
	      bl = "branch -l";
	      c = "commit";
	      co = "checkout";
	      d = "diff";
	      g = "grep";
	      m = "merge";
	      p = "pull";
	      pu = "push";
	      rv = "revert";
	      s = "status";
	      st = "status";
	      lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
	      last = "log -1 HEAD";
	      f = "push --force-with-lease";
	      w = "whatchanged";
	      # https://stackoverflow.com/a/11688523/472927
	      ss = "!f() { git stash show stash^{/$*} -p; }; f";
	      sa = "!f() { git stash apply stash^{/$*}; }; f";
	      sl = "stash list";
	      tag = "tag -s";
	      # https://docs.gitignore.io/install/command-line
	      ig = "!gi() { curl -sL https://www.toptal.com/developers/gitignore/api/$@ ;}; gi";
      };
      ignores = [
        ".vscode/"
      ];
      extraConfig = {
      	init.defaultBranch = "main";
        tag = {
          gpgsign = true;
          forceSignAnnotated = true;
        };
        color.ui = true;
        core = {
          autocrlf = "input";
	        safecrlf = true;
        };
        merge.tool = "nvim -d";
        pull.ff = "only";
        push.default = "simple";
        help.autocorrect = "1";
        diff = {
          algorithm = "patience";
          compactionHeuristic = true;
        };
        commit = {
          gpgsign = true;
        };
      };
    };
  };
}
