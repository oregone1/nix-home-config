{ pkgs, ... }:
{
  config = {
    "bar/top" = {
      monitor = "\${env:MONITOR:LVDS-1}";
      width = "100%";
      height = "3%";
      radius = 0;
      modules-center = "date";
    };

    "module/date" = {
      type = "internal/date";
      internal = 5;
      date = "%d.%m.%y";
      time = "%H:%M";
      label = "%time%  %date%";
    };
  };
  script = "polybar top &";
}
