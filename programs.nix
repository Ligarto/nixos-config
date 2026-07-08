{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    fastfetch
    xwayland-satellite
    nerd-fonts.jetbrains-mono
    nautilus
    brave-origin
  ];
}
