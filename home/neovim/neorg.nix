{ ... }:
{
  programs.nvf.settings.vim.notes.neorg = {
    enable = true;

    setupOpts = {
      load = {
        "core.defaults".config = { };
        "core.concealer".config = { };
        "core.dirman".config = {
          workspaces = {
            notes = "~/Notes";
          };
          default_workspace = "notes";
        };
      };
    };
  };
}
