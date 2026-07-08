{ pkgs,noctalia, ... }:
{
  home.username = "ligarto";
  home.homeDirectory = "/home/ligarto";
  home.stateVersion = "26.05";

  imports = [
    ./niri
    ./noctalia
  ];

  programs.home-manager.enable = true;
}
