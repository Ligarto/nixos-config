{ nvf, ... }: {
  programs.nvf.settings.vim.keymaps = [

    #:Ex but keybind
    {
      key = "<leader>cd";
      mode = "n";
      action = "<cmd>Ex<CR>";
      desc = "Open netrw File Explorer";
    }

    #Screen center magic
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

    #Open undotree
    {
      key = "<leader>u";
      mode = "n";
      action = "<cmd>UndotreeToggle<CR>";
      desc = "Toggle Undotree";
    }

    #Move selection
    {
      key = "J";
      mode = "v";
      silent = true;
      action = ":m '>+1<CR>gv=gv";
    }
    {
      key = "K";
      mode = "v";
      silent = true;
      action = ":m '<-2<CR>gv=gv";
    }

    #Better J
    {
      key = "J";
      mode = "n";
      silent = true;
      action = "mzJ`z";
    }

    #delete to void
    {
      key = "<leader>p";
      mode = "x";
      silent = true;
      action = "\"_dP";
    }
    {
      key = "<leader>d";
      mode = "n";
      silent = true;
      action = "\"_d";
    }
    {
      key = "<leader>d";
      mode = "v";
      silent = true;
      action = "\"_d";
    }
  ];
}
