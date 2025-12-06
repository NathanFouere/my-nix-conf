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
      hour_format = "hour24";
      vim_mode = false;
      show_edit_predictions = false;
      show_completions_on_input = false;
    };
  };
}
