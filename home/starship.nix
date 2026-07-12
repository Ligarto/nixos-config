# home/starship.nix
{ ... }:
{
  programs.starship = {
    enable = true;

    settings = {
      "$schema" = "https://starship.rs/config-schema.json";

      format = ''
        $username$hostname$directory$git_branch$git_state$git_status$cmd_duration
        $character
      '';

      directory.style = "bold #ebbcba"; # rose

      character = {
        success_symbol = "[❯](bold #c4a7e7)"; # iris
        error_symbol = "[❯](bold #eb6f92)"; # love
        vimcmd_symbol = "[❮](bold #9ccfd8)"; # foam
      };

      git_branch = {
        format = "[$branch]($style)";
        style = "#908caa"; # subtle
      };

      git_status = {
        format = "[[(*$conflicted$untracked$modified$staged$renamed$deleted)](#ebbcba) ($ahead_behind$stashed)]($style)";
        style = "#9ccfd8"; # foam
      };

      git_state = {
        format = "([$state( $progress_current/$progress_total)]($style)) ";
        style = "#908caa"; # subtle
      };

      cmd_duration = {
        format = "[$duration]($style) ";
        style = "#f6c177"; # gold
      };
    };
  };
}
