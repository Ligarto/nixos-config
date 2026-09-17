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
    texlab
    (texlive.combine {
      inherit (texlive) scheme-small latexmk;
    })
    android-tools
    kdePackages.dolphin
    unzip
    jq
    (python3.withPackages (ps: with ps; [ evdev ]))
    ydotool
    steam-run
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
