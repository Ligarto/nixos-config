# home/niri/keybinds.nix
{config, ...}: {
  programs.niri.settings.binds = with config.lib.niri.actions; {
    "Mod+T".action = spawn "kitty";
    "Mod+Q".action = close-window;
    "Mod+Left".action = focus-column-left;
    "Mod+Right".action = focus-column-right;
    "Mod+Control+Left".action = move-column-left;
    "Mod+Control+Right".action = move-column-right;
    "Print".action.screenshot = {};
  };
}
