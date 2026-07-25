# home/scripts.nix
{ pkgs, ... }:
{
  home.packages = [
    (pkgs.writeShellScriptBin "web-bookmarks" (builtins.readFile ./web-bookmarks.sh))
  ];
}
