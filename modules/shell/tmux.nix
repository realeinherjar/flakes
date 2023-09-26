{
  programs = {
    tmux = {
      enable = true;
      historyLimit = 100000;
      mouse = false;
      keyMode = "vi";
      escapeTime = 0;
      baseIndex = 1;
      shortcut = "a";
      extraConfig = ''
        # Enables italics in tmux
        set -g default-terminal "tmux-256color"
        set -ga terminal-overrides ",xterm-256color*:Tc"
        set -ga terminal-overrides ",foot:Tc"

        # Turns off the status bar
        set -g status on

        # TMUX and VIM Focus Events
        set-option -g focus-events on

        # Start window numbering at specific num
        set -g base-index 1
        setw -g pane-base-index 1

        # Renumber windows on window close
        set -g renumber-windows on

        # Fix titlebar
        set -g set-titles on
        set -g set-titles-string "#T"

        #######################################################
        # KEY BINDING
        #######################################################

        # New windows and panes are in current path
        bind c new-window      -c "#{pane_current_path}"
        bind % split-window -h -c "#{pane_current_path}"
        bind \" split-window -v -c "#{pane_current_path}"

        # hjkl pane traversal
        bind h select-pane -L
        bind j select-pane -D
        bind k select-pane -U
        bind l select-pane -R

        # copy to X clipboard
        bind -T copy-mode-vi v send -X begin-selection
        bind -T copy-mode-vi y send-keys -X copy-pipe 'xclip -in -selection clipboard &> /dev/null'
        bind -T copy-mode-vi Enter send-keys -X cancel

        # shortcut for moving tmux buffer to clipboard
        # useful if you've selected with the mouse
        bind-key -nr C-y run "tmux show-buffer | pbcopy" # doesn't work on MacOS

        ########################
        ### CATPPUCCIN MOCHA ###
        ########################

        set-option -gq status-bg "#1e1e2e"
        set-option -gq status-justify "left"
        set-option -gq status-left-length "100"
        set-option -gq status-right-length "100"

        # messages
        set-option -gq message-style "fg=#89dceb,bg=#313244,align=centre"
        set-option -gq message-command-style "fg=#89dceb,bg=#313244,align=centre"

        # panes
        set-option -gq pane-border-style "fg=#313244"
        set-option -gq pane-active-border-style "fg=#89b4fa"

        # windows
        set-option -gqw window-status-activity-style "fg=#cdd6f4,bg=#1e1e2e,none"
        set-option -gqw window-status-separator ""
        set-option -gqw window-status-style "fg=#cdd6f4,bg=#1e1e2e,none"

        # status
        set-option -gq status-left ""
        set-option -gq status-right "#[fg=#f5c2e7,bg=#1e1e2e,nobold,nounderscore,noitalics]#[fg=#1e1e2e,bg=#f5c2e7,nobold,nounderscore,noitalics]$window_icon #[fg=#cdd6f4,bg=#313244] #W #{?client_prefix,#[fg=#f38ba8],#[fg=#a6e3a1]}#[bg=#313244]#{?client_prefix,#[bg=#f38ba8],#[bg=#a6e3a1]}#[fg=#1e1e2e]$session_icon #[fg=#cdd6f4,bg=#313244] #S "
        set-window-option -gq window-status-format "#[fg=#1e1e2e,bg=#89b4fa] #I #[fg=#cdd6f4,bg=#313244] #{b:pane_current_path} "
        set-window-option -gq window-status-current-format "#[fg=#1e1e2e,bg=#fab387] #I #[fg=#cdd6f4,bg=#1e1e2e] #{b:pane_current_path} "

        # Modes

        set-window-option -gq clock-mode-colour "#89b4fa"
        set-window-option -gq mode-style "fg=#f5c2e7 bg=#585b70 bold"

        ######################
        ### STATUS BAR     ###
        ######################
        set -g status-interval 1
      '';
    };
  };
}
