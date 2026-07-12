{ pkgs, ... }:
{
  home.packages = [ pkgs.capitaine-cursors ];

  home.pointerCursor = {
    package = pkgs.capitaine-cursors;
    name = "capitaine-cursors";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  home.sessionVariables = {
    XCURSOR_THEME = "capitaine-cursors";
    XCURSOR_SIZE = "24";
    NIXOS_OZONE_WL = "1";
  };

  programs.niri.settings.cursor = {
    theme = "capitaine-cursors";
    size = 24;
  };
}
