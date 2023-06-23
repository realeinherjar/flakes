{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      cava
      cmus
      opustags
    ];
  };
  home.file.".config/cmus/rc".text = ''
    colorcheme catppuccin
    bind -f common ^T push run opustags -s FIELD=VALUE -i {}
  '';
  home.file.".config/cmus/catppuccin.theme" = ''
    ### 'Catppuccin' theme for CMus (for 255 color terms)
    set color_cmdline_bg=default
    # Text Color White
    set color_cmdline_fg=254
    # Error Color Red
    set color_error=211
    # Info Color Yellow
    set color_info=223
    # Separator Color Blue
    set color_separator=117
    
    # Statusline background Black
    set color_statusline_bg=default
    #Statusline foreground #White
    set color_statusline_fg=254
    
    # Titleline background Green
    set color_titleline_bg=151
    # Titleline foreground Black
    set color_titleline_fg=16
    
    # Terminal default as background
    set color_win_bg=default
    
    # Currently Playing song Blue 
    set color_win_cur=117
    # Indicator over currently playing song Green
    set color_win_cur_sel_bg=151
    set color_win_cur_sel_fg=16
    
    # Browser Directory Colors White
    set color_win_dir=254
    
    # Playlist browser general text color White
    set color_win_fg=254
    # Selected inactive Directory of currently playing Album/Song Maroon bg Black fg 
    set color_win_inactive_cur_sel_bg=181
    set color_win_inactive_cur_sel_fg=235
  '';
}
