let
  laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINeye3GYq2JE0NtTOZpiewKnLdjlBdtB1sTQpk0h7eUH nathanfouere@tutanota.com";
  tour = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICAufs2QxpRFDJW6SGMWg0dEev+m6qO5j0liQjkxDS6H nathanfouere@tutanota.com";
  personnal_devices = [ laptop tour ];

  # Ici ajouter les thinkcentre
  #systems = [ ];
in
{
  "tailscale.age".publicKeys = [ personnal_devices ];
}
