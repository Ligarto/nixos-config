# home/niri/style.nix — layout, input, outputs
{ ... }:
{
  programs.niri.settings = {
    prefer-no-csd = true;
    input = {
      keyboard.xkb = { layout = "es"; variant = "ast"; };
      touchpad = { tap = true; natural-scroll = true; };
    };
    outputs."eDP-1".scale = 1.0;
    layout = {
      gaps = 16;
      center-focused-column = "never";
      focus-ring = { enable = true; width = 2; };
      default-column-width = { proportion = 0.5; };
    };
  };
}
