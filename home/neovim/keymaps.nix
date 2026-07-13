{ nvf, ... }: {
  programs.nvf.settings.vim.keymaps = [
    {
      key = "<leader>cd";
      mode = "n";
      action = "<cmd>Ex<CR>";
      desc = "Open netrw File Explorer";
    }
    {
      key = "<C-d>";
      mode = "n";
      silent = true;
      action = "<C-d>zz";
    }
    {
      key = "<C-u>";
      mode = "n";
      silent = true;
      action = "<C-u>zz";
    }
    {
      key = "n";
      mode = "n";
      silent = true;
      action = "nzz";
    }
    {
      key = "N";
      mode = "n";
      silent = true;
      action = "Nzz";
    }
  ];
}
