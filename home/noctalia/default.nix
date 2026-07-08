# home/noctalia/default.nix
{ pkgs, noctalia, ... }:
{
  home.packages = [
    noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
  xdg.configFile."noctalia/noctalia-settings.json".source = ./settings.json;
}
