{pkgs, lib, ... }:
{
  package = pkgs.i3-gaps;
  config = {
    keybindings = 
    let 
      term = "st";
      menu = "rofi -show drun";
    in 
    lib.mkDefault {
      "Mod4+space"       = "mode space";
    };

    modes = {
      resize = {
        "Left" = "resize shrink width 10 px or 10 ppt";
        "Down" = "resize shrink height 10 px or 10 ppt";
        "Up" = "resize grow height 10 px or 10 ppt";
        "Right" = "resize grow width 10 px or 10 ppt";
        "Escape" = "mode space";
        "Shift+Escape"   = "mode default";
      };
      space = {
        "Escape"         = "mode default";
        "Shift+Escape"   = "mode default";
        "space"          = "exec rofi -show window --no-icons";
        "Return"         = "exec st";
        "w"              = "mode workspaces_or_windows";
        "d"              = "kill";
        "f"              = "fullscreen toggle";
        "t"              = "floating toggle";
        "r"              = "mode resize";
        "semicolon"      = "exec rofi -show drun";
      };
      workspaces_or_windows = {
        "Escape"         = "mode space";
        "Shift+Escape"   = "mode default";
        "s"              = "mode workspaces";
        "d"              = "mode windows";
      };
      workspaces = {
        "Escape"         = "mode workspaces_or_windows";
        "Shift+Escape"   = "mode default";
        "m"              = "mode workspaces_move";
        "g"              = "mode workspaces_goto";
      };
      workspaces_move = {
        "Escape"         = "mode workspaces";
        "Shift+Escape"   = "mode default";
        "0"              = "move container to workspace number 0";
        "1"              = "move container to workspace number 1";
        "2"              = "move container to workspace number 2";
        "3"              = "move container to workspace number 3";
        "4"              = "move container to workspace number 4";
        "5"              = "move container to workspace number 5";
        "6"              = "move container to workspace number 6";
        "7"              = "move container to workspace number 7";
        "8"              = "move container to workspace number 8";
        "9"              = "move container to workspace number 9";
        "a"              = "move container to workspace number 10";
        "b"              = "move container to workspace number 11";
        "c"              = "move container to workspace number 12";
        "d"              = "move container to workspace number 13";
        "e"              = "move container to workspace number 14";
        "f"              = "move container to workspace number 15";  
      };     
      workspaces_goto = {
        "Escape"         = "mode workspaces";
        "Shift+Escape"   = "mode default";
        "0"              = "workspace number 0";
        "1"              = "workspace number 1";
        "2"              = "workspace number 2";
        "3"              = "workspace number 3";
        "4"              = "workspace number 4";
        "5"              = "workspace number 5";
        "6"              = "workspace number 6";
        "7"              = "workspace number 7";
        "8"              = "workspace number 8";
        "9"              = "workspace number 9";
        "a"              = "workspace number 10";
        "b"              = "workspace number 11";
        "c"              = "workspace number 12";
        "d"              = "workspace number 13";
        "e"              = "workspace number 14";
        "f"              = "workspace number 15";  
      };
      windows = {
        "Escape"         = "mode workspaces_or_windows";
        "Shift+Escape"   = "mode default";
        "m"              = "mode windows_move";
        "g"              = "mode windows_goto";
      };
      windows_move = {
        "Escape"         = "mode windows";
        "Shift+Escape"   = "mode default";
        "comma"          = "move up";
        "a"              = "move left";
        "o"              = "move down";
        "e"              = "move right";
      };
      windows_goto = {
        "Escape"         = "mode windows";
        "Shift+Escape"   = "mode default";
        "comma"          = "focus up";
        "a"              = "focus left";
        "o"              = "focus down";
        "e"              = "focus right";
      };
    };

    floating = 
    let
      mod = "Mod4";
    in {
      modifier = mod;
      criteria = [
        { class = "floating"; }
      ];
    };

    colors = {
      focused = {
        background = "#F28FAD";
        border = "#F28FAD";
        childBorder = "#F28FAD";
        indicator = "#F28FAD";
        text = "#ebdbb2";
      };
      focusedInactive = {
        background = "#96CDFB";
        border = "#96CDFB";
        childBorder = "#96CDFB";
        indicator = "#96CDFB";
        text = "#ebdbb2";
      };
      unfocused = {
        background = "#1E1E2E";
        border = "#1E1E2E";
        childBorder = "#1E1E2E";
        indicator = "#1E1E2E";
        text = "#ebdbb2";
      };
      urgent = {
        background = "#FF5C5D";
        border = "#FF5C5D";
        childBorder = "#FF5C5D";
        indicator = "#FF5C5D";
        text = "#ebdbb2";
      };
      placeholder = {
        background = "#89DCEB";
        border = "#89DCEB";
        childBorder = "#89DCEB";
        indicator = "#89DCEB";
        text = "#ebdbb2 ";
      };
    };

    bars = [
      {
        statusCommand = "i3status-rs /home/natalie/.config/i3status-rust/config-top_bar.toml";
        fonts = {
          names = [ "monospace" "Font Awesome 6 Free" "Font Awesome 6 Brands" ];
          size = 8.0;
        };
        position = "top";
        colors = {
          background = "#1E1D2F";
        # seperator = "#6E6C7E";
        statusline = "#F5E0DC";
        focusedWorkspace = {
          border = "#1E1D2F";
          background = "#F28FAD";
          text = "#131020";
        };
        activeWorkspace = {
          border = "#1E1D2F";
          background = "#DDB6F2";
          text = "#131020";
        };
        inactiveWorkspace = {
          border = "#1E1D2F";
          background = "#73DCFF";
          text = "#131020";
        };
        urgentWorkspace = {
          border = "#1E1D2F";
          background = "#F28FAD:";
          text = "#131020";
        };
      };
    }
  ];
  startup = [
    { command = "xinput --set-prop \"TPPS/2 IBM TrackPoint\" \"Coordinate Transformation Matrix\" 0.75 0 0 0 .75 0 0 0 2"; always = true; }
    { command = "feh --bg-fill ~/Pictures/wallpaper"; always = true; }
    { command = "picom &"; always = true; }
    { command = "nix-shell ~/homepage/shell.nix"; always = true; }
  ];
};
  extraConfig = ''
    for_window [class="Matplotlib"] floating enable
    for_window [class="matplotlib"] floating enable
  '';
}
