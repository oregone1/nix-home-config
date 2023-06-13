{ pkgs, ... }:
{
  package = pkgs.dunst;
  settings = {
    global = {
      font = "Noto Sans 11";
      transparency = 10;
      frame_color = "#D4C4A8";
      background = "#1D2021";
      foreground = "#D4C4A8";
      geometry = "400x100-20+40";
      separator_height = 1;
      colors = true;
      color_normal = "#D4C4A8,#1D2021,#BDAE93";
      color_urgent = "#D4C4A8,#CC241D,#1D2021";
      color_low = "#D4C4A8,#3D3F3B,#BDAE93";
      format = "<b>%a %Y-%m-%d %H:%M:%S</b>\n<b>%s</b>\n%b";
      frame_width = 2;
    };

    urgency_low = {
      timeout = 5;
    };

    urgency_normal = {
      timeout = 10;
    };

    urgency_critical = {
      timeout = 30;
    };
  };
}

