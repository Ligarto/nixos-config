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
    ./scripts
    ./easyeffects
    ./kitty.nix
    ./alacritty.nix
    ./theme.nix
    ./shell.nix
    ./starship.nix
    ./cursor.nix
    ./default-apps.nix
    ./fuzzel.nix
    ./zathura.nix
    ./yt-dlp.nix
    ./rmpc.nix
  ];

  programs.home-manager.enable = true;
}
