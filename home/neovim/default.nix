{ nvf, ... }: {
  imports = [
    nvf.homeManagerModules.default
    ./keymaps.nix
    ./opts.nix
    ./harpoon.nix
  ];

  programs.nvf = {
    enable = true;
    enableManpages = true;

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
      binds.whichKey.enable = true;
      utility.undotree.enable = true;

      treesitter.enable = true;
      lsp = {
        enable = true;
        formatOnSave = true;
      };

      languages = {
        enableTreesitter = true;
        #Languages here:
        nix.enable = true;
      };

      autocomplete.nvim-cmp.enable = true;

      undoFile = {
        enable = true;
        path = "~/.vim/undodir";
      };
    };
  };
}
