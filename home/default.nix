{ pkgs,noctalia, ... }:
{
  home.username = "ligarto";
  home.homeDirectory = "/home/ligarto";
  home.stateVersion = "26.05";

  imports = [
    ./niri.nix
    ./noctalia.nix
  ];

  programs.home-manager.enable = true;
}
