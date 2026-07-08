{config, ... }:
{
  programs.niri.settings = {
    # Don't ask niri apps to draw their own title bars/borders — let niri handle it.
    prefer-no-csd = true;

    input = {
      keyboard.xkb = {
        layout = "es";
        variant = "ast";
      };
      touchpad = {
        tap = true;
        natural-scroll = true;
      };
    };

    outputs = {
      # Replace "eDP-1" with your real output name once we check it (see note below).
      "eDP-1" = {
        scale = 1.0;
      };
    };

    layout = {
      gaps = 16;
      center-focused-column = "never";

      focus-ring = {
        enable = true;
        width = 2;
      };

      default-column-width = { proportion = 0.5; };
    };

    binds = with config.lib.niri.actions; {
      "Mod+T".action = spawn "kitty";
      "Mod+Q".action = close-window;
      "Mod+Left".action = focus-column-left;
      "Mod+Right".action = focus-column-right;
      "Mod+Control+Left".action = move-column-left;
      "Mod+Control+Right".action = move-column-right;
      "Mod+Shift+E".action = quit;
      "Print".action.screenshot = {};
    };

    spawn-at-startup = [
      { command = [ "noctalia-shell" ]; }
    ];

  };
}
