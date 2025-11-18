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
      "make"
      "dockerfile"
      "docker-compose"
    ];
    userSettings = {
      theme = lib.mkForce {
        mode = "system";
        dark = "Base16 Tokyo City Terminal Dark";
        light = "Base16 Tokyo City Terminal Light";
      };
      hour_format = "hour24";
      vim_mode = false;
    };
  };
}
