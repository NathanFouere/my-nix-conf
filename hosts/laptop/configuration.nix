{
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/base.nix
    ../../modules/system/base-perso.nix
    ../../modules/system/stylix.nix
    ../../modules/system/zsh.nix
    ../../modules/system/gnome.nix
    ../../modules/system/docker.nix
    ../../modules/system/vial.nix
    ../../modules/system/agenix.nix
  ];

  networking.hostName = "laptop";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?


  users.users.nathanf.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOhTHlEnfulDgNtuM5l1lBeQJgDMfALFLw95Z4YsSd4h nathanfouere@tutanota.com" # tour
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINFoS7IQ8mdWhwm7TDzE/FQ/Ntl+90xmUPHgozDtx59z nathanf@nixos" # thinkcentre-1
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ1gmWWXnCxaSEgdYK3rR9vNg9OnSzeLOJ7Cc3cDlRsJ nathanf@nixos" # thinkcentre-2
  ];

  home-manager = {
    # also pass inputs to home-manager modules
    extraSpecialArgs = { inherit inputs; };
    users = {
      "nathanf" = import ../../home/home-perso.nix;
    };
  };

  swapDevices = [
    {
      device = "/swapfile";
      size = 16 * 1024; # 16GB
    }
  ];
}
