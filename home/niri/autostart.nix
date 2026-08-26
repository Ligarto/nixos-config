# home/niri/autostart.nix
{ pkgs, ... }:
{
  programs.niri.settings.spawn-at-startup = [
    { command = [ "noctalia-shell" ]; }
    {
      command = [
        "${pkgs.dbus}/bin/dbus-update-activation-environment"
        "--systemd"
        "WAYLAND_DISPLAY"
        "XDG_CURRENT_DESKTOP=niri"
      ];
    }
    {
      command = [
        "systemctl"
        "--user"
        "restart"
        "xdg-desktop-portal.service"
      ];
    }
    #   { command = [ "easyeffects --service-mode -w" ]; }
  ];
}
