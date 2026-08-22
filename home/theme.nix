{ pkgs, ... }:
{
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };

  dconf.settings."org/gnome/desktop/interface" = {
    color-scheme = "prefer-dark";
    gtk-theme = "Adwaita-dark";
    cursor-theme = "capitaine-cursors";
    cursor-size = 24;
    icon-theme = "Papirus-Dark";
  };

  xdg.configFile."gtk-3.0/gtk.css".text = ''
    @define-color theme_bg_color #191724;
    @define-color theme_fg_color #e0def4;
    @define-color theme_base_color #1f1d2e;
    @define-color theme_selected_bg_color #c4a7e7;
    @define-color theme_selected_fg_color #191724;
    @define-color theme_text_color #e0def4;
    @define-color borders #403d52;
    @define-color warning_color #f6c177;
    @define-color error_color #eb6f92;
    @define-color success_color #9ccfd8;
  '';

  xdg.configFile."gtk-4.0/gtk.css".text = ''
    @define-color window_bg_color #191724;
    @define-color window_fg_color #e0def4;
    @define-color view_bg_color #191724;
    @define-color view_fg_color #e0def4;
    @define-color headerbar_bg_color #1f1d2e;
    @define-color headerbar_fg_color #e0def4;
    @define-color sidebar_bg_color #1f1d2e;
    @define-color sidebar_fg_color #e0def4;
    @define-color popover_bg_color #26233a;
    @define-color popover_fg_color #e0def4;
    @define-color accent_bg_color #c4a7e7;
    @define-color accent_fg_color #191724;
    @define-color accent_color #c4a7e7;
    @define-color destructive_bg_color #eb6f92;
    @define-color destructive_fg_color #191724;
    @define-color success_bg_color #9ccfd8;
    @define-color warning_bg_color #f6c177;
    @define-color error_bg_color #eb6f92;

    window.background {
      background-color: alpha(@window_bg_color, 0.75);
    }
  '';
}
