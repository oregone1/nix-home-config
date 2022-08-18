{ pkgs, mkLiteral, ... }:
{
  font = "JetBrainsMono Nerd Font 14";
  extraConfig = {
    modi = "run,drun,window";
    lines = 5;
    show-icons = true;
    icon-theme = "Oranchelo";
    terminal = "kitty";
    drun-display-format = "{icon} {name}";
    disable-history = false;
    hide-scrollbar = true;
    display-drun  = "   Apps ";
    display-run = "   Run ";
    display-window = " 﩯  window";
    display-Network = " 󰤨  Network";
    sidebar-mode = true;
  };

  theme = {
    # catppuccin
    "*" = {
      bg-col = mkLiteral "#1E1D2F";
      bg-col-light = mkLiteral "#1E1D2F";
      border-col = mkLiteral "#1E1D2F";
      selected-col = mkLiteral "#1E1D2F";
      blue = mkLiteral "#7aa2f7";
      fg-col = mkLiteral "#D9E0EE";
      fg-col2 = mkLiteral "#F28FAD";
      grey = mkLiteral "#D9E0EE";
      width = 600;
    };

    "element-text" = {
      background-color = mkLiteral "inherit";
      text-color = mkLiteral "inherit";
    };

    "element-icon" = {
      background-color = mkLiteral "inherit";
      text-color = mkLiteral "inherit";
    };

    "mode-switcher" = {
      background-color = mkLiteral "inherit";
      text-color = mkLiteral "inherit";
    };

    "window" = {
      height = mkLiteral "360px";
      border = mkLiteral "3px";
      border-color = mkLiteral "@border-col";
      background-color = mkLiteral "@bg-col";
    };

    "mainbox" = {
      background-color = mkLiteral "@bg-col";
    };

    "inputbar" = {
      children = map mkLiteral [ "prompt" "entry" ];
      background-color = mkLiteral "@bg-col";
      border-radius = mkLiteral "5px";
      padding = mkLiteral "2px";
    };

    "prompt" = {
      background-color = mkLiteral "@blue";
      padding = mkLiteral "6px";
      text-color = mkLiteral "@bg-col";
      border-radius = mkLiteral "3px";
      margin = mkLiteral "20px 0px 0px 20px";
    };

    "textbox-prompt-colon" = {
      expand = false;
      str = ":";
    };

    "entry" = {
      padding = mkLiteral "6px";
      margin = mkLiteral "20px 0px 0px 20px";
      text-color = mkLiteral "@fg-col";
      background-color = mkLiteral "@bg-col";
    };

    "listview" = {
      border = mkLiteral "0px 0px 0px";
      padding = mkLiteral "6px 0px 0px";
      margin = mkLiteral "10px 0px 0px 20px";
      columns = 2;
      background-color = mkLiteral "@bg-col";
    };

    "element" = {
      padding = mkLiteral "5px";
      background-color = mkLiteral "@bg-col";
      text-color = mkLiteral "@fg-col";
    };

    "element-icon" = {
      size = mkLiteral "25px";
    };

    "element selected" = {
      background-color = mkLiteral "@selected-col";
      text-color = mkLiteral "@fg-col2";
    };

    "mode-switcher" = {
      spacing = 0;
    };

    "button" = {
      padding = mkLiteral "10px";
      background-color = mkLiteral "@bg-col-light";
      text-color = mkLiteral "@grey";
    };

    "button selected" = {
      background-color = mkLiteral "@bg-col";  
      text-color = mkLiteral "@blue";
    };
  };
}
