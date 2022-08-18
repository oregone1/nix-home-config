{ pkgs, ... }:
{
  bars = {
    bottom_bar = {
      blocks = [
        {
          block = "external_ip";
          format = "{ip}";
        }
        {
          block = "net";
          format = "{ip}@{ssid}({signal_strength}, {speed_down;M*b})";
          on_click = "kitty --class floating bash -c \"nmtui; exit\"";
        }
        {
          block = "battery";
          interval = 5;
          format = "{percentage} {time} {power}";
        }
        {
          block = "cpu";
          interval = 1;
          format = "{utilization}";
        }
        {
          block = "memory";
          format_mem = "{mem_used} /{mem_total}";
          interval = 1;
        }
        {
          block = "disk_space";
          path = "/";
          info_type = "used";
          format = "{used}/{total}";
          unit = "GB";
          alert = 110;
          warning = 100;
        }
        {
          block = "disk_space";
          path = "/home";
          info_type = "used";
          format = "{used}/{total}";
          unit = "GB";
          alert = 800;
          warning = 775;
        }
        {
          block = "time";
          format = "%F %H:%M:%S";
        }
      ];
      settings = {
        theme = {
          overrides = {
            idle_bg = "#1E1D2F";
            good_bg = "#1E1D2F";
            info_bg = "#1E1D2F";
            warning_bg = "#1E1D2F";
            critical_bg = "#1E1D2F";
            separator_bg = "#1E1D2F";
  
            idle_fg = "#96CDFB";
            good_fg = "#ABE9B3";
            info_fg = "#DDB6F2";
            warning_fg = "#F8BD96";
            critical_fg = "#F28FAD";
            separator_fg = "#F28FAD";
          };
        };
      };
    };
  };
}


