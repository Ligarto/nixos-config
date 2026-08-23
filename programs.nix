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
    nh
    protonup-ng
    lutris
    pavucontrol
    devenv
    (prismlauncher.override {
      jdks = [
        jdk21
        jdk17
        jdk8
      ];
    })
    fuzzel
    texliveSmall
    android-tools
    kdePackages.dolphin
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  programs.obs-studio.enable = true;
}
