# home/theme.nix
{ pkgs, ... }:
{
  gtk = {
    enable = true;
    theme = {
      name = "rose-pine-gtk";
      package = pkgs.rose-pine-gtk-theme;
    };
  };

  dconf.settings."org/gnome/desktop/interface" = {
    color-scheme = "prefer-dark";
    gtk-theme = "rose-pine-gtk";
  };
}
