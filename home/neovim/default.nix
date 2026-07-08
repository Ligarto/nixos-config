{ nvf, ... }: {
  imports = [ nvf.homeManagerModules.default ];

  programs.nvf = {
    enable = true;
    enableManpages = true; # gives you `man 5 nvf` for the full option reference, in your terminal

    settings.vim = {
      viAlias = true;
      vimAlias = true;

      theme = {
        enable = true;
        name = "rose-pine";
        style = "main";
      };

      statusline.lualine.enable = true;
      telescope.enable = true;
      treesitter.enable = true;

      lsp = {
        enable = true;
        formatOnSave = true;
      };

      languages = {
        enableLSP = true;
        enableTreesitter = true;

        nix.enable = true;
      };

      autocomplete.nvim-cmp.enable = true;

      opts = {
        shiftwidth = 2;
      };
    };
  };
}
