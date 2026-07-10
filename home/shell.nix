# home/shell.nix
{ pkgs, ... }:
{
  programs.fish = {
    enable = true;

    shellAliases = {
      ls = "ls -la";
      nrs = "sudo nixos-rebuild switch --flake ~/.nix-files#old-laptop";
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
