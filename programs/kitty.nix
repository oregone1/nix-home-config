{ pkgs, ... }:
{
  font = {
    name = "Fira Code";
    size = 10;
  };
  theme = "Catppuccin";
  settings = {
    # enable ligatures
    font_family                 = "Fira Code Regular Nerd Font Complete";
    disable_ligatures           = "never";
    font_features               = "FiraCodeNerdFontComplete-Regular";
      
    # cursor
    cursor_shape                = "block";
    cursor_beam_thickness       = "1.5";
    cursor_underline_thickness  = "2.0";
    cursor_blink_interval       = "0.75";
    cursor_stop_blinking_after  = "0";

    # scrolling
    scrollback_lines            = "10000";
    scrollback_pager            = "less --chop-long-lines --RAW-CONTROL-CHARS +INPUT_LINE_NUMBER";
    wheel_scroll_multiplier     = "5.0";

    # mouse
    mouse_hide_wait             = "1";

    # text manipulation
    select_by_word_characters   = "@-./_~?&=%+#";
    
    # term
    enable_audio_bell           = "no"; 
    confirm_os_window_close     = "0";
    kitty_mod                   = "control";
  };
  # TODO figure out why I can't send sigterm with ctrl+c
  keybindings = {
    # clipboard
    "ctrl+shift+c"      = "copy_to_clipboard";
    "ctrl+shift+v"      = "paste_from_clipboard";
  
    # window management
    "ctrl+enter"        = "new_window";
    "ctrl+w"            = "close_window";
    "ctrl+shift+."      = "next_window";
    "ctrl+shift+,"      = "previous_window";

    "ctrl+shift+right"  = "move_window_forward";
    "ctrl+shift+up"     = "move_window_up";
    "ctrl+shift+left"   = "move_window_backward";
    "ctrl+shift+down"   = "move_window_to_bottom";

    "ctrl+shift+r"      = "start_resizing_window";
  };
}

