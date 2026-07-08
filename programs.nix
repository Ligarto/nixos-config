{ pkgs, ... }:
{
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    fastfetch
    xwayland-satellite
    nerd-fonts.jetbrains-mono
  ];
}
