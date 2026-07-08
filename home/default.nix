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
    ./kitty.nix
    ./theme.nix
  ];

  programs.home-manager.enable = true;
}
