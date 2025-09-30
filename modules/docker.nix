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
      docker
      lazydocker
    ];
  };
}
