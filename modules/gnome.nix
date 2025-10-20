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
    services = {
      xserver = {
        enable = true;
        displayManager = {
          gdm.enable = true;
        };
        desktopManager = {
          gnome.enable = true;
        };
        xkb = {
          layout = "fr";
          variant = "azerty";
        };
      };
    };

    # Enable touchpad support (enabled default in most desktopManager).
    # services.xserver.libinput.enable = true;
    #

    environment.systemPackages = with pkgs; [
      gnome-tweaks
    ];

    environment.gnome.excludePackages = with pkgs; [
      epiphany # web browser
      simple-scan # document scanner
      yelp # help viewer
      geary # email client
      seahorse # password manager

      # these should be self explanatory
      gnome-contacts
      gnome-maps
      gnome-music
      gnome-weather
    ];
  };
}
