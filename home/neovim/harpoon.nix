{ pkgs, ... }:

{
  programs.nvf.settings.vim = {
    extraPlugins.harpoon = {
      package = pkgs.vimPlugins.harpoon;
      setup = "require('harpoon').setup({})";
    };

    extraPlugins.plenary-nvim.package = pkgs.vimPlugins.plenary-nvim;

    keymaps = [
      {
        key = "<leader>ha";
        mode = "n";
        action = "<cmd>lua require('harpoon.mark').add_file()<CR>";
        desc = "Harpoon: Add file";
      }
      {
        key = "<leader>hh";
        mode = "n";
        action = "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>";
        desc = "Harpoon: Toggle Menu";
      }
      {
        key = "<leader>h1";
        mode = "n";
        action = "<cmd>lua require('harpoon.ui').nav_file(1)<CR>";
        desc = "Harpoon: File 1";
      }
      {
        key = "<leader>h2";
        mode = "n";
        action = "<cmd>lua require('harpoon.ui').nav_file(2)<CR>";
        desc = "Harpoon: File 2";
      }
      {
        key = "<leader>h3";
        mode = "n";
        action = "<cmd>lua require('harpoon.ui').nav_file(3)<CR>";
        desc = "Harpoon: File 3";
      }
      {
        key = "<leader>h4";
        mode = "n";
        action = "<cmd>lua require('harpoon.ui').nav_file(4)<CR>";
        desc = "Harpoon: File 4";
      }
      {
        key = "<leader>h5";
        mode = "n";
        action = "<cmd>lua require('harpoon.ui').nav_file(5)<CR>";
        desc = "Harpoon: File 5";
      }
    ];
  };
}
