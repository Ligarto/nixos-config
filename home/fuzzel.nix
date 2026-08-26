# home/fuzzel.nix
{ ... }:
{
  programs.fuzzel = {
    enable = true;

    settings = {
      main = {
        font = "JetBrainsMono Nerd Font:size=12";
        terminal = "kitty";
        layer = "overlay";
        width = 40;
        horizontal-pad = 20;
        vertical-pad = 12;
        inner-pad = 8;
      };

      colors = {
        background = "191724dd"; # base, slightly transparent
        text = "e0def4ff"; # text
        match = "c4a7e7ff"; # iris — highlights matched substring
        selection = "403d52ff"; # highlight-med — selected row background
        selection-text = "e0def4ff"; # text
        selection-match = "c4a7e7ff"; # iris
        border = "c4a7e7ff"; # iris
        prompt = "9ccfd8ff"; # foam
        placeholder = "908caaff"; # subtle
        input = "e0def4ff"; # text
        counter = "908caaff"; # subtle
      };
      border = {
        width = 2;
      };
    };
  };
}
