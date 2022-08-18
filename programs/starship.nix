{ pkgs, ... }:
{
  enableBashIntegration = true;
  settings = {
    add_newlines = false;
    format = "$all";
    scan_timeout = 10;

    character = {
      format = "$symbol ";
      error_symbol = "[λ](bold red)";
      success_symbol = "[λ](bold green)";
    };

    battery = {
      full_symbol = " ";
      charging_symbol = " ";
      discharging_symbol = " ";
      unknown_symbol = " ";
      empty_symbol = " ";
      disabled = false;
      format = "[$symbol$percentage]($style) ";

      display = [
        { threshold = 10; style = "red bold"; }
        { threshold = 40; style = "yellow bold"; }
      ];
    };

    cmd_duration = {
      min_time = 2000;
      format = "took [$duration](yellow bold)";
      show_notifications = true;
      min_time_to_notify = 30000;
    };

    directory = {
      truncate_to_repo = true;
      use_logical_path = true;
      format = "[$path](cyan bold)[$read_only](red)";
      read_only = "🔒";
      truncate_symbol = "...";
      home_symbol = "~";
    };

    git_branch = {
      format = "on [$symbol$branch]($style)(:[$remote]($style)) ";
      symbol = " ";
      style = "bold purple";
      truncation_length = 9223372036854775807;
      truncation_symbol = "...";
    };

    git_commit = {
      commit_hash_length = 7;
      format = "[\($hash$tag\)](green bold) ";
    };

    git_metrics = {
      format = "([+$added](bold green) )([-$deleted](bold red) )";
    };

    git_status = {
      format = "([$all_status$ahead_behind]($style) )";
      style = "red bold";
      stashed = "\$";
      ahead = "⇡";
      behind = "⇣";
      up_to_date = "";
      diverged = "⇕";
      conflicted = "=";
      deleted = "✘";
      renamed = "»";
      modified = "!";
      staged = "+";
      untracked = "?";
    };

    hostname = {
      ssh_only = false;
      trim_at = ".";
      format = "[$hostname](purple dimmed) in ";
    };

    nix_shell = {
      format = "via [❄️ $state( \($name\))](bold blue) ";
    };

    username = {
      format = "[$user]($style)@";
      style_root = "red bold";
      style_user = "yellow bold";
      show_always = true;
    };
  };
}
