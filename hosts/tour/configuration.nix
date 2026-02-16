{
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/base.nix
    ../../modules/system/stylix.nix
    ../../modules/system/zsh.nix
    ../../modules/system/gnome.nix
    ../../modules/system/docker.nix
    ../../modules/system/vial.nix
    ../../modules/system/nvidia.nix
  ];

  networking.hostName = "tour";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

  security.pki.certificateFiles = [
    ./certs/mkcert/rootCA.pem
  ];

  swapDevices = [{
    device = "/swapfile";
    size = 16 * 1024; # 16GB
  }];
}
