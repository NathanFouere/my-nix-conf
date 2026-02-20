{
  pkgs,
  ...
}:

{

  home = {
    username = "admin";
    homeDirectory = "/home/admin";
    stateVersion = "25.11";
  };

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    wget
    git
    sshpass
    mkcert
    unzip
    htop
    lazygit
    util-linux
    lsof
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
