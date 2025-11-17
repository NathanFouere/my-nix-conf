{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:

{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "toml"
      "rust"
      "cpp"
      "php"
      "html"
      "js"
      "catppuccin-icons"
    ];
    userSettings = {
      theme = lib.mkForce {
        mode = "system";
        dark = "Base16 Tokyo City Terminal Dark";
        light = "Base16 Tokyo City Terminal Light";
      };
      autosave = {
        enabled = true;
        delay = 100;
      };
      hour_format = "hour24";
      vim_mode = false;
    };
  };
}
