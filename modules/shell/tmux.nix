{
  programs = {
    tmux = {
      enable = true;
      extraConfig = ''
      ######################################################################
      # START OF GENERAL CONFIGURATIONS
      ######################################################################
      
      # set scroll history to 100,000 lines
      set-option -g history-limit 100000
      
      # Turn on interactivity with mouse 
      set -g mouse on
      
      # Enables italics in tmux
      set -g default-terminal "tmux-256color"
      set -ga terminal-overrides ",xterm-256color*:Tc"
      set -ga terminal-overrides ",foot:Tc"
      
      # Turns off the status bar
      set -g status on
      
      # Change the position of the status bar
      # set-option -g status-position bottom
      
      # TMUX and VIM Focus Events
      set-option -g focus-events on
      
      # Start window numbering at specific num
      set -g base-index 1
      setw -g pane-base-index 1
      
      # Renumber windows on window close
      set -g renumber-windows on
      
      # Avoid ESC delay
      set -s escape-time 0
      
      # Fix titlebar
      set -g set-titles on
      set -g set-titles-string "#T"
      
      # VIM mode
      set -g mode-keys vi
      
      #######################################################
      # KEY BINDING
      #######################################################
      
      # Remap prefix from 'C-b' to 'C-a'
      unbind C-b
      set-option -g prefix C-a
      bind-key C-a send-prefix
      
      # C-b to server prefix in nested tmux stuff
      bind-key -n C-b send-prefix
      
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
      
      ######################################################################
      # END OF GENERAL CONFIGURATIONS
      ######################################################################
      
      ######################
      ### DESIGN CHANGES ###
      ######################
      
      # WARNING: hex colors can't contain capital letters
      # --> Catppuccin (Mocha)
      thm_bg="#1e1e2e"
      thm_fg="#cdd6f4"
      thm_cyan="#89dceb"
      thm_black="#181825"
      thm_gray="#313244"
      thm_magenta="#cba6f7"
      thm_pink="#f5c2e7"
      thm_red="#f38ba8"
      thm_green="#a6e3a1"
      thm_yellow="#f9e2af"
      thm_blue="#89b4fa"
      thm_orange="#fab387"
      thm_black4="#585b70"
      
      ######################
      ### STATUS BAR     ###
      ######################
      set -g status-interval 1
      # uptime
      #set-option -ag status-right "#[fg=#b8bb26,bg=default]#(uptime | awk -F, '{sub(\".*up \",x,$1); print $1}')"
      set-option -ag status-right "#[fg=#b8bb26,bg=default] up:#(uptime | cut -f 4-5 -d ' ' | cut -f 1 -d ',')"
      '';
    };
  };
}
