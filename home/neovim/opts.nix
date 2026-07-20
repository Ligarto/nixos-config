{ nvf, ... }: {
  programs.nvf.settings.vim = {
    hideSearchHighlight = true;
    opts = {
      shiftwidth = 2;
      cursorline = true;
      wrap = false;
    };
    options = {
      scrolloff = 6;
    };
  };
}
