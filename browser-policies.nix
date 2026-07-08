# browser-policies.nix
{ ... }:
{
  environment.etc."brave/policies/managed/policies.json".text = builtins.toJSON {
    ExtensionSettings = {
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" = {
        # uBlock Origin
        installation_mode = "force_installed";
        update_url = "https://clients2.google.com/service/update2/crx";
      };
      "noimedcjdohhokijigpfcbjcfcaaahej" = {
        # Rosé Pine theme
        installation_mode = "force_installed";
        update_url = "https://clients2.google.com/service/update2/crx";
      };
    };
  };
}
