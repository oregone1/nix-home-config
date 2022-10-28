{ pkgs, ... }:
{
  options = {
    recolor = true;
    adjust-open = "width";
    window-title-basename = true;
    selection-clipboard = "clipboard";

    notification-error-bg       = "#ff5555"; # Red
    notification-error-fg       = "#abb2bf"; # Foreground
    notification-warning-bg     = "#ffb86c"; # Orange
    notification-warning-fg     = "#44475a"; # Selection
    notification-bg             = "#1e222a"; # Background
    notification-fg             = "#abb2bf"; # Foreground

    completion-bg               = "#1e222a"; # Background
    completion-fg               = "#5c6370"; # Comment
    completion-group-bg         = "#1e222a"; # Background
    completion-group-fg         = "#5c6370"; # Comment
    completion-highlight-bg     = "#44475a"; # Selection
    completion-highlight-fg     = "#abb2bf"; # Foreground

    index-bg                    = "#1e222a"; # Background
    index-fg                    = "#abb2bf"; # Foreground
    index-active-bg             = "#44475a"; # Current Line
    index-active-fg             = "#abb2bf"; # Foreground

    inputbar-bg                 = "#1e222a"; # Background
    inputbar-fg                 = "#abb2bf"; # Foreground
    statusbar-bg                = "#1e222a"; # Background
    statusbar-fg                = "#abb2bf"; # Foreground

    highlight-color             = "#ffb86c"; # Orange
    highlight-active-color      = "#ffb86c"; # Orange

    default-bg                  = "#1e222a"; # Background
    default-fg                  = "#abb2bf"; # Foreground

    render-loading              = true;
    render-loading-fg           = "#1e222a"; # Background
    render-loading-bg           = "#abb2bf"; # Foreground

    recolor-lightcolor          = "#1e222a"; # Background
    recolor-darkcolor           = "#abb2bf"; # Foreground
  };
}
