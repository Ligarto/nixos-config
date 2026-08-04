# home/neovim/latex.nix
{ pkgs, ... }:
{
  programs.nvf.settings.vim = {
    extraPlugins.vimtex = {
      package = pkgs.vimPlugins.vimtex;
    };

    globals = {
      vimtex_view_method = "zathura";
      vimtex_compiler_method = "latexmk";
    };

    lsp.servers.texlab = {
      enable = true;
      package = pkgs.texlab;
      cmd = [ "${pkgs.texlab}/bin/texlab" ];
      filetypes = [
        "tex"
        "plaintex"
        "bib"
      ];
      root_markers = [
        ".git"
        ".latexmkrc"
      ];
    };
  };
}
