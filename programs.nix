{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    btop
    fastfetch
    xwayland-satellite
    nerd-fonts.jetbrains-mono
    nautilus
    brave-origin
    sddm-theme
    eza
    protonup-ng
    lutris
    pavucontrol
    prismlauncher-unwrapped
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;
}
