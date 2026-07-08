{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };

    settings = {
      confirm_os_window_close = 0;
      scrollback_lines = 10000;
      enable_audio_bell = false;

      background_opacity = "0.65";
      window_padding_width = 8;

      cursor_shape = "beam";
      cursor_blink_interval = 0;
    };

    keybindings = {
      "ctrl+shift+c" = "copy_to_clipboard";
      "ctrl+shift+v" = "paste_from_clipboard";
      "ctrl+shift+equal" = "increase_font_size";
      "ctrl+shift+minus" = "decrease_font_size";
    };

    themeFile = "rose-pine";
  };
}
