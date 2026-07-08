# home/niri/keybinds.nix
{ config, ... }: {
  programs.niri.settings.binds = with config.lib.niri.actions; {
    "Mod+T".action = spawn "kitty";
    "Mod+D".action = spawn-sh "noctalia-shell ipc call launcher toggle";
    "Mod+B".action = spawn-sh "brave-origin & disown";
    "Mod+E".action = spawn "nautilus";

    "XF86AudioRaiseVolume" = {
      action = spawn-sh "noctalia-shell ipc call volume increase";
      allow-when-locked = true;
    };
    "XF86AudioLowerVolume" = {
      action = spawn-sh "noctalia-shell ipc call volume decrease";
      allow-when-locked = true;
    };
    "XF86AudioMute" = {
      action = spawn-sh "noctalia-shell ipc call volume muteOutput";
      allow-when-locked = true;
    };
    "XF86AudioMicMute" = {
      action = spawn-sh "noctalia-shell ipc call volume muteInput";
      allow-when-locked = true;
    };
    "XF86AudioNext" = {
      action = spawn-sh "noctalia-shell ipc call media next";
      allow-when-locked = true;
    };
    "XF86AudioPrev" = {
      action = spawn-sh "noctalia-shell ipc call media previous";
      allow-when-locked = true;
    };
    "XF86AudioPlay" = {
      action = spawn-sh "noctalia-shell ipc call media playPause";
      allow-when-locked = true;
    };
    "XF86AudioPause" = {
      action = spawn-sh "noctalia-shell ipc call media playPause";
      allow-when-locked = true;
    };
    "XF86MonBrightnessUp" = {
      action = spawn-sh "noctalia-shell ipc call brightness increase";
      allow-when-locked = true;
    };
    "XF86MonBrightnessDown" = {
      action = spawn-sh "noctalia-shell ipc call brightness decrease";
      allow-when-locked = true;
    };

    "Mod+Q".action = close-window;

    "Mod+Left".action = focus-column-left;
    "Mod+Right".action = focus-column-right;
    "Mod+Up".action = focus-window-up;
    "Mod+Down".action = focus-window-down;

    "Mod+Control+Left".action = move-column-left;
    "Mod+Control+Right".action = move-column-right;
    "Mod+Control+Up".action = move-window-up;
    "Mod+Control+Down".action = move-window-down;

    "Mod+Shift+Left".action = focus-monitor-left;
    "Mod+Shift+Right".action = focus-monitor-right;
    "Mod+Shift+Up".action = focus-monitor-up;
    "Mod+Shift+Down".action = focus-monitor-down;

    "Mod+Shift+Control+Left".action = move-column-to-monitor-left;
    "Mod+Shift+Control+Right".action = move-column-to-monitor-right;
    "Mod+Shift+Control+Up".action = move-column-to-monitor-up;
    "Mod+Shift+Control+Down".action = move-column-to-monitor-down;

    "Mod+Page_Up".action = focus-workspace-up;
    "Mod+Page_Down".action = focus-workspace-down;
    "Mod+Control+Page_Up".action = move-column-to-workspace-up;
    "Mod+Control+Page_Down".action = move-column-to-workspace-down;

    "Mod+Control+F".action = expand-column-to-available-width;
    "Mod+C".action = center-column;
    "Mod+Control+C".action = center-visible-columns;
    "Mod+Minus".action = set-column-width "-10%";
    "Mod+Plus".action = set-column-width "+10%";
    "Mod+Control+Minus".action = set-window-height "-10%";
    "Mod+Control+Plus".action = set-window-height "+10%";

    "Mod+V".action = toggle-window-floating;
    "Mod+Shift+V".action = switch-focus-between-floating-and-tiling;
    "Mod+F".action = maximize-column;
    "Mod+Shift+F".action = fullscreen-window;
    "Mod+O".action = toggle-overview;

    "Print".action.screenshot = { };

  };
}
