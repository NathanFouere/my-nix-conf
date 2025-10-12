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
  fonts.packages = with pkgs; [ _0xproto ];
  stylix.enable = true;
  stylix.targets.qt.enable = false;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/embers.yaml";
  stylix.image = ../assets/wallpaper/dark.jpg;
  
  stylix.fonts = {
    serif = {
      package = pkgs._0xproto;
      name = "0xProto";
    };

    sansSerif = {
      package = pkgs._0xproto;
      name = "0xProto";
    };

    monospace = {
      package = pkgs._0xproto;
      name = "0xProto";
    };

    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
  };
}
