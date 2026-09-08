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
        temurin-bin-25
        temurin-bin-21
        temurin-bin-17
        temurin-bin-8
      ];
    })
    fuzzel
    texliveSmall
    android-tools
    kdePackages.dolphin
    unzip
    jq
    (python3.withPackages (ps: with ps; [ evdev ]))
    ydotool
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
