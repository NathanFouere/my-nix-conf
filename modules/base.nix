{ lib, config, pkgs, inputs, ... }:
let
  inherit (lib) mkIf mkDefault;
in
{
  # (facultatif) tu peux aussi déclarer tes propres options
  # options.my.common.enable = lib.mkEnableOption "Base commune";

  config = {
  
    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
  
    networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  
    nix.settings.experimental-features = ["nix-command" "flakes"];
    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  
    # Enable networking
    networking.networkmanager.enable = true;
  
    # Set your time zone.
    time.timeZone = "Europe/Paris";
  
    # Select internationalisation properties.
    i18n.defaultLocale = "fr_FR.UTF-8";
  
    i18n.extraLocaleSettings = {
      LC_ADDRESS = "fr_FR.UTF-8";
      LC_IDENTIFICATION = "fr_FR.UTF-8";
      LC_MEASUREMENT = "fr_FR.UTF-8";
      LC_MONETARY = "fr_FR.UTF-8";
      LC_NAME = "fr_FR.UTF-8";
      LC_NUMERIC = "fr_FR.UTF-8";
      LC_PAPER = "fr_FR.UTF-8";
      LC_TELEPHONE = "fr_FR.UTF-8";
      LC_TIME = "fr_FR.UTF-8";
    };
  };
}
