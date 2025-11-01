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

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = "Europe/Paris";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";
    i18n.supportedLocales = [ "en_US.UTF-8/UTF-8" ];

    i18n.extraLocaleSettings = {
      LC_ADDRESS       = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT   = "en_US.UTF-8";
      LC_MONETARY      = "en_US.UTF-8";
      LC_NAME          = "en_US.UTF-8";
      LC_NUMERIC       = "en_US.UTF-8";
      LC_PAPER         = "en_US.UTF-8";
      LC_TELEPHONE     = "en_US.UTF-8";
      LC_TIME          = "en_US.UTF-8";
    };


    # Enable sound with pipewire.
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };

    # Configure console keymap
    console.keyMap = "en";

    # Enable CUPS to print documents.
    services.printing.enable = true;

    home-manager = {
      # also pass inputs to home-manager modules
      extraSpecialArgs = { inherit inputs; };
      users = {
        "nathanf" = import ../home/home.nix;
      };
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.nathanf = {
      isNormalUser = true;
      description = "Nathan Fouéré";
      extraGroups = [
        "networkmanager"
        "wheel"
        "docker"
      ];
    };

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    programs.firefox = {
      enable = true;
      policies = {
        ImportEnterpriseRoots = true;
      };
    };
    programs.nix-ld.enable = true;
    environment.systemPackages = with pkgs; [
      clang-tools
      obsidian
      vscode
      zed-editor
      discord
      whatsapp-for-linux
      telegram-desktop
      vesktop
      qbittorrent
      gimp
      ansible
      chromium
      postman
      steam
      libreoffice
      go
      python314
      mysql84
      statix
      nixfmt-rfc-style
      vlc
      htop
      element-desktop
      obs-studio
      util-linux
      wabt
    ];

    networking.extraHosts = ''
      	192.168.49.2 client.local
      	192.168.49.2 authentication.local
      	192.168.49.2 db-authentication.local
    '';
  };
}
