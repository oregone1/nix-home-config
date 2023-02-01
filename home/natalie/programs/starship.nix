{ pkgs, ... }:
{
  enableBashIntegration = true;
  settings = {
    add_newline = true;
    format = "$all";
    scan_timeout = 10;

    character = {
      format = "$symbol ";
      error_symbol = "[λ](bold fg:#ED8796)";
      success_symbol = "[λ](bold fg:#8AADF4)";
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
        { threshold = 10; style = "fg:#ED8796 bold"; }
        { threshold = 40; style = "fg:#EED49F bold"; }
      ];
    };

    cmd_duration = {
      min_time = 2000;
      format = "took [$duration](fg:#8BD5CA bold)";
      show_notifications = true;
      min_time_to_notify = 30000;
    };

    directory = {
      truncate_to_repo = true;
      use_logical_path = true;
      format = "[$path](fg:#89DCEB bold)[$read_only](red) ";
      read_only = "🔒";
      home_symbol = "~";
    };

    git_branch = {
      format = "on [$symbol$branch]($style)(:[$remote]($style)) ";
      symbol = " ";
      style = "bold fg:#F5BDE6";
      truncation_length = 9223372036854775807; # ???
      truncation_symbol = "...";
    };

    git_commit = {
      commit_hash_length = 7;
      format = "[\($hash$tag\)](fg:#A6DA95 bold) ";
    };

    git_metrics = {
      format = "([+$added](bold fg:#A6DA95) )([-$deleted](bold fg:#ED8796) )";
    };

    git_status = {
      format = "([$all_status$ahead_behind]($style) )";
      style = "fg:#ED8796 bold";
      stashed = "$";
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
      format = "[$hostname](fg:#8AADF4) in ";
    };

    nix_shell = {
      format = "via [❄️ $state( \($name\))](bold blue) ";
    };

    username = {
      format = "[$user]($style)@";
      style_root = "fg:#ED8796 bold";
      style_user = "fg:#F5BDE6 bold";
      show_always = true;
    };
  };
}
