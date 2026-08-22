# home/easyeffects.nix
{ ... }:
{
  services.easyeffects = {
    enable = true;
    preset = "denoise-mic";

    extraPresets.denoise-mic = builtins.fromJSON (builtins.readFile ./easyeffects-mic.json);
  };
}
