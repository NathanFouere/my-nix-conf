{ lib, config, pkgs, inputs, ... }:
let
  inherit (lib) mkIf mkDefault;
in
{
  config = {
  
    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
  
  
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
      console.keyMap = "fr";
      
      # Enable CUPS to print documents.
      services.printing.enable = true;
      
        home-manager = {
          # also pass inputs to home-manager modules
          extraSpecialArgs = {inherit inputs;};
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
          extraGroups = [ "networkmanager" "wheel" "docker" ];
          packages = with pkgs; [
          #  thunderbird
          ];
        };
        
          virtualisation.docker = {
            enable = true;
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
            
            environment.systemPackages = with pkgs; [
               clang-tools
               jetbrains.datagrip
               obsidian
               vscode
               spotify
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
               mkcert
               jetbrains.goland
               nodejs_22
               inetutils
            ];
            
            networking.extraHosts = ''
               	10.110.144.69 client.local
               	10.110.144.69 authentication.local
          '';
  };
}
