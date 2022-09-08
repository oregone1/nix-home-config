{ pkgs, lib, ... }:
{
  package = pkgs.i3-gaps;
  config = {
    keybindings = 
    let 
      term = "kitty";
      menu = "rofi -show drun";
      mod  = "Mod4";
    in 
    lib.mkDefault {
      "${mod}+Shift+c"     = "exec i3-msg restart";
      "${mod}+Shift+e"     = "exec i3-nagbar -t warning -m 'exit?' -B 'Yes' 'i3-msg exit'";

      "${mod}+Return"      = "exec ${term}";
      "${mod}+r"           = "exec ${menu}";
      "${mod}+w"           = "kill";
      "${mod}+Shift+r"     = "mode resize";
      "${mod}+Tab"         = "focus mode_toggle";

      "${mod}+1"           = "workspace number 1";
      "${mod}+2"           = "workspace number 2";
      "${mod}+3"           = "workspace number 3";
      "${mod}+4"           = "workspace number 4";
      "${mod}+5"           = "workspace number 5";
      "${mod}+6"           = "workspace number 6";
      "${mod}+7"           = "workspace number 7";
      "${mod}+8"           = "workspace number 8";
      "${mod}+9"           = "workspace number 9";
      "${mod}+10"          = "workspace number 10";

      "${mod}+Shift+1"     = "move container to workspace number 1";
      "${mod}+Shift+2"     = "move container to workspace number 2";
      "${mod}+Shift+3"     = "move container to workspace number 3";
      "${mod}+Shift+4"     = "move container to workspace number 4";
      "${mod}+Shift+5"     = "move container to workspace number 5";
      "${mod}+Shift+6"     = "move container to workspace number 6";
      "${mod}+Shift+7"     = "move container to workspace number 7";
      "${mod}+Shift+8"     = "move container to workspace number 8";
      "${mod}+Shift+9"     = "move container to workspace number 9";
      "${mod}+Shift+10"    = "move container to workspace number 10";

      "${mod}+Left"        = "focus left";
      "${mod}+Down"        = "focus down";
      "${mod}+Up"          = "focus up";
      "${mod}+Right"       = "focus right";

      "${mod}+Shift+Left"  = "move left";
      "${mod}+Shift+Down"  = "move right";
      "${mod}+Shift+Up"    = "move up";
      "${mod}+Shift+Right" = "move right";

      "${mod}+h"           = "split h";
      "${mod}+v"           = "split v";
      "${mod}+f"           = "fullscreen toggle";
      "${mod}+space"       = "floating toggle";
    };

    modes = {
      resize = {
        "Left" = "resize shrink width 10 px or 10 ppt";
        "Down" = "resize shrink height 10 px or 10 ppt";
        "Up" = "resize grow height 10 px or 10 ppt";
        "Right" = "resize grow width 10 px or 10 ppt";
        "Escape" = "mode default";
        "Return" = "mode default";
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
}
