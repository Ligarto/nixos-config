{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_zen;

  networking.hostName = "old-laptop";
  networking.networkmanager.enable = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  time.timeZone = "Atlantic/Canary";
  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_ES.UTF-8";
    LC_IDENTIFICATION = "es_ES.UTF-8";
    LC_MEASUREMENT = "es_ES.UTF-8";
    LC_MONETARY = "es_ES.UTF-8";
    LC_NAME = "es_ES.UTF-8";
    LC_NUMERIC = "es_ES.UTF-8";
    LC_PAPER = "es_ES.UTF-8";
    LC_TELEPHONE = "es_ES.UTF-8";
    LC_TIME = "es_ES.UTF-8";
  };

  services.upower.enable = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "noctalia";
    extraPackages = [
      pkgs.sddm-theme
      pkgs.kdePackages.qtdeclarative
      pkgs.kdePackages.qt5compat
    ];

    settings = {
      General = {
        InputMethod = "";
        # This explicitly overrides variables for the SDDM greeter process itself
        # Change 1.25 to 1.5 or 2 depending on your display's target density scale
        GreeterEnvironment = "QT_SCREEN_SCALE_FACTORS=1.25,QT_FONT_DPI=96";
      };
    };
  };

  systemd.services.display-manager.environment = {
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_SCALE_FACTOR = "1.25";
  };

  programs.niri.enable = true;
  console.keyMap = "es";

  programs.dconf.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
  };

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  hardware.graphics.enable = true;

  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;

  security.wrappers.brave-origin-chrome-sandbox = {
    owner = "root";
    group = "root";
    setuid = true;
    source = "${pkgs.brave-origin}/opt/brave.com/brave-origin/chrome-sandbox";
  };

  users.users."ligarto" = {
    isNormalUser = true;
    description = "Ligarto";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
  programs.fish.enable = true;
  users.users."ligarto".shell = pkgs.fish;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    #neovim
    kitty
  ];

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  networking.firewall.allowedTCPPorts = [ 22 ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?
}
