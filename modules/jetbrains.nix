{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:
let
  inherit (lib) mkIf mkDefault;
in
{
  config = {
    environment.systemPackages = with pkgs; [
      jetbrains.datagrip
      jetbrains.pycharm-professional
    ];
  };
}
