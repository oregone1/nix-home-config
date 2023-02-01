{ pkgs, ... }:
{
  options = {
    recolor = true;
    adjust-open = "width";
    window-title-basename = true;
    selection-clipboard = "clipboard";

    notification-error-bg       = "#f38ba8"; # Red
    notification-error-fg       = "#1e1e2e"; # Foreground
    notification-warning-bg     = "#fab387"; # Orange
    notification-warning-fg     = "#1e1e2e"; # Selection
    notification-bg             = "#181825"; # Background
    notification-fg             = "#1e1e2e"; # Foreground

    completion-bg               = "#313244"; # Background
    completion-fg               = "#5c6370"; # Comment
    completion-group-bg         = "#313244"; # Background
    completion-group-fg         = "#5c6370"; # Comment
    completion-highlight-bg     = "#313244"; # Selection
    completion-highlight-fg     = "#abb2bf"; # Foreground

    index-bg                    = "#1e1e2e"; # Background
    index-fg                    = "#abb2bf"; # Foreground
    index-active-bg             = "#44475a"; # Current Line
    index-active-fg             = "#abb2bf"; # Foreground

    inputbar-bg                 = "#181825"; # Background
    inputbar-fg                 = "#89b4fa"; # Foreground
    statusbar-bg                = "#181825"; # Background
    statusbar-fg                = "#89b4fa"; # Foreground

    highlight-color             = "#cba6f7"; # Orange
    highlight-active-color      = "#cba6f7"; # Orange

    default-bg                  = "#1e1e2e"; # Background
    default-fg                  = "#cdd6f4"; # Foreground

    render-loading              = true;
    render-loading-fg           = "#1e1e2e"; # Background
    render-loading-bg           = "#cdd6f4"; # Foreground

    recolor-lightcolor          = "#1e1e2e"; # Background
    recolor-darkcolor           = "#cdd6f4"; # Foreground
  };
}
