{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:

{
  programs.ghostty = {
    enable = true;

    settings = {
      font-size = 12;
    };
  };
}
