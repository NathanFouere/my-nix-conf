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
      kubectl
      minikube
      kubernetes-helm
      skaffold
    ];
  };
}
