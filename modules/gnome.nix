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
    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Enable the GNOME Desktop Environment.
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "fr";
      variant = "azerty";
    };

    # Enable touchpad support (enabled default in most desktopManager).
    # services.xserver.libinput.enable = true;
    #

    environment.systemPackages = with pkgs; [
      gnomeExtensions.just-perfection
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
