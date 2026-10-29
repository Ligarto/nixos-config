{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;

    settings = {
      general = {
        # Rose Pine theme from the alacritty-theme package
        import = [ "${pkgs.alacritty-theme}/rose-pine.toml" ];
      };

      window = {
        opacity = 0.65;
        padding = {
          x = 8;
          y = 8;
        };
        dynamic_padding = true;
      };

      font = {
        size = 11;
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
      };

      scrolling.history = 10000;

      cursor = {
        style = {
          shape = "Beam";
          blinking = "Off";
        };
      };

      bell.duration = 0;

      keyboard.bindings = [
        {
          key = "C";
          mods = "Control|Shift";
          action = "Copy";
        }
        {
          key = "V";
          mods = "Control|Shift";
          action = "Paste";
        }
        {
          key = "Plus";
          mods = "Control|Shift";
          action = "IncreaseFontSize";
        }
        {
          key = "Minus";
          mods = "Control|Shift";
          action = "DecreaseFontSize";
        }
      ];
    };
  };
}
