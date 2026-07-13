# home/shell.nix
{ pkgs, ... }:
{
  programs.fish = {
    enable = true;

    shellAliases = {
      ls = "eza -al --color=always --group-directories-first --icons";
      nrs = "nh os switch ~/.nix-files";
      nrsu = "nh os switch ~/.nix-files --update";
    };

    shellAbbrs = {
    };

    functions = {
      mkcd = {
        description = "Make a directory and cd into it";
        body = "mkdir -p $argv[1] && cd $argv[1]";
      };
    };

    interactiveShellInit = ''
      set -g fish_greeting ""
    '';
  };
}
