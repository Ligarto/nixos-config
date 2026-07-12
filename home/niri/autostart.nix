# home/niri/autostart.nix
{ pkgs, ... }:
{
  programs.niri.settings.spawn-at-startup = [
    { command = [ "noctalia-shell" ]; }
    #   { command = [ "easyeffects --service-mode -w" ]; }
  ];
}
