{
  pkgs,
  noctalia,
  ...
}:
{
  home.username = "ligarto";
  home.homeDirectory = "/home/ligarto";
  home.stateVersion = "26.05";

  imports = [
    ./niri
    ./noctalia
    ./neovim
    ./discord
    ./kitty.nix
    ./theme.nix
    ./shell.nix
    ./starship.nix
    ./easyeffects.nix
    ./cursor.nix
    ./default-apps.nix
  ];

  programs.home-manager.enable = true;
}
