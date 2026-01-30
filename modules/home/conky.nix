{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    conky
  ];

  # cf . https://discourse.nixos.org/t/how-run-a-process-or-command-at-startup/54160/2
  systemd.user.services.conky = {
    Unit = {
      Description = "Conky System Monitor";
      PartOf = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.conky}/bin/conky";
      Restart = "on-failure";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
