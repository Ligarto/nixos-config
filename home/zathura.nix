# home/zathura.nix
{ ... }:
{
  programs.zathura = {
    enable = true;
    options = {
      selection-clipboard = "clipboard";

      default-bg = "#191724"; # void/background — base (darkest)
      default-fg = "#e0def4";

      statusbar-fg = "#e0def4";
      statusbar-bg = "#1f1d2e";

      inputbar-bg = "#1f1d2e";
      inputbar-fg = "#e0def4";

      notification-bg = "#1f1d2e";
      notification-fg = "#e0def4";
      notification-error-bg = "#1f1d2e";
      notification-error-fg = "#eb6f92";
      notification-warning-bg = "#1f1d2e";
      notification-warning-fg = "#f6c177";

      completion-bg = "#26233a";
      completion-fg = "#e0def4";
      completion-highlight-bg = "#c4a7e7";
      completion-highlight-fg = "#191724";

      highlight-color = "#f6c177";
      highlight-active-color = "#c4a7e7";

      recolor = true;
      recolor-lightcolor = "#26233a"; # page background — overlay (a step lighter than base)
      recolor-darkcolor = "#e0def4"; # text
      recolor-reverse-video = true;
      recolor-keephue = true;
    };
  };
}
